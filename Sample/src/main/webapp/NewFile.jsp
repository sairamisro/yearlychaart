 <%@ page import="java.text.*,java.sql.*,java.util.*,java.text.*,vvv.dbconnection.* "%>
<%@ page import="javax.servlet.http.HttpSession" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   

<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>SELECT Operation</title>
</head>
    <sql:setDataSource var="snapshot" driver="oracle.jdbc.OracleDriver"
                       url="jdbc:oracle:thin:@localhost:1521:orcl"
                       user="system"  password="system"/>

    <sql:query dataSource="${snapshot}" var="result">
        SELECT * from employee;
    </sql:query>

    <table border="1" width="100%">
        <tr>
            <th>No</th>
        </tr>
        <c:forEach var="row" items="${result.row}">
            <tr>
                <td>11: <c:out value="${row.EID}"/></td>
            </tr>
        </c:forEach>
    </table>






<html lang="en">
  <head>
    <title>Charting</title>
    <meta http-equiv="content-type" content="text-html; charset=utf-8" />

    <script type="text/javascript" src="jscharting.js"></script>


    <style></style>  
  </head>
   <%
   
   

try {


Connection con = null;
System.out.println("conn----------1");
Class.forName("oracle.jdbc.driver.OracleDriver");
System.out.println("conn----------2");
con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "system", "system");
Statement st = null;
PreparedStatement ps=null;
ResultSet rs =null;
String query = " SELECT * from employee;";

ps.executeUpdate(query);

} catch(Exception ex){

} 
   
   
	
%>

  
  <body>
  
 
    <div id="chartDiv1" class="chartDiv" style="max-width: 700px;height: 400px;"></div>
  		   

    <script type="text/javascript">
      /*
Toggle visibility of a critical dependency path highlighting.
Learn how to:

  - Highlight a specific branch in the dependency hierarchy.
*/  

      // JS
      // Helper functions to create axisTick label template with two columns of text describing each task.
      var columnWidths = [80, 30],
        span = function(val, width) {
          return '<span style="width:' + width + 'px;">' + val + '</span>';
        },
        mapLabels = function(labels) {
          return labels
            .map(function(v, i) {
              return span(v, columnWidths[i]);
            })
            .join('');
        },
        tickTemplate = mapLabels(['%name']);

      // The critical path
      var criticalPath = 'site_prep,power,excavation,foundation,framing,roofing,interior'.split(','),
        criticalpathStyle = { color: '#d50000', width: 2 };

      var chart = JSC.chart(
        'chartDiv1',
        {
          title_label_text: 'Floating Test Range from %min to %max',
          legend_visible: false,

          /*Typical Gantt setup. Horizontal columns by default.*/
          type: 'horizontal column solid',
          /*Make columns overlap.*/
          zAxis_scale_type: 'stacked',
          /*Time Y Axis.*/
          yAxis: {
            scale: { type: 'time', range: { padding: 0 } }
          },
          xAxis: { spacingPercentage: 0.5 },
          palette: ['#33658A', '#86BBD8', '#758E4F', '#F6AE2D', '#F26419', '#590925'],
          defaultSeries: {
              defaultPoint: {
                xAxisTick_label_text: tickTemplate,
                outline_width: 0,
                tooltip: '<b>%name</b> <br/>%low - %high<br/>{days(%high-%low)} days'
              }
            },
          series: [
            {
              points: [
                { name: 'Suppyorder3', y: ['05/10/2016', '11/30/2018'], id: 'water', parent: 'site_prep' },
                { name: 'Suppyorder4', y: ['05/01/2013', '05/30/2020'], id: 'power', parent: 'site_prep' },
                
              ]
            },
            {
              points: [
                { name: 'Suppyorder6', y: ['10/26/2017', '08/30/2018'], id: 'water', parent: 'site_prep' },
                { name: 'Suppyorder7', y: ['03/16/2018', '11/29/2019'], id: 'power', parent: 'site_prep' },
               
              ]
            },  {
                points: [
                  { name: 'Suppyorder9', y: ['03/16/2018', '09/15/2020'], id: 'water', parent: 'site_prep' },
                  { name: 'Suppyorder10', y: ['04/02/2018', '12/31/2018'], id: 'power', parent: 'site_prep' },
                 
                ]
              },  {
                  points: [
                    { name: 'Suppyorder12', y: ['08/24/2018', '12/31/2021'], id: 'water', parent: 'site_prep' },
                    { name: 'Suppyorder13', y: ['12/03/2018', '05/02/2019'], id: 'power', parent: 'site_prep' },
                   
                  ]
                },  {
                    points: [
                      { name: 'Suppyorder15', y: ['12/19/2018', '09/15/2020'], id: 'water', parent: 'site_prep' },
                      { name: 'Suppyorder16', y: ['01/04/2019', '12/31/2019'], id: 'power', parent: 'site_prep' },
                     
                    ]
                  },  
                     
                  
            {
              points: [
                {
                  name: 'Excavation',
                  y: ['11/27/2020', '11/30/2021'],
                  id: 'excavation',
                  parent: 'septic,water,power,data'
                }
              ]
            },
            {
              points: [
                { name: 'Foundation', y: ['12/01/2020', '01/31/2022'], id: 'foundation', parent: 'excavation' },

                { name: 'Windows', y: ['01/18/2022', '01/31/2022'], id: 'windows', parent: 'framing' }
              ]
            },
            {
              points: [{ name: 'Interior', y: ['05/02/2022', '06/30/2022'], id: 'interior', parent: 'windows,roofing' }]
            },
            {
              points: [{ name: 'Grading', y: ['06/15/2022', '09/13/2022'], id: 'grading', parent: 'excavation' }]
            }
          ],
          toolbar_items: {
            'Critical Path': {
              type: 'checkbox',
              value: true,
              position: 'inside top right',
              events_change: function(value) {
                var chart = this.chart;
                if (value) {
                  chart.connectors(criticalPath, criticalpathStyle);
                } else {
                  chart.connectors();
                }
              }
            }
          }
        },
        highlightCriticalPath
      );

      function highlightCriticalPath(chart) {
        chart.connectors(criticalPath, criticalpathStyle);
      }
      function abc()
      {
    	  window.open("abc.jsp");
      }
    </script>
    <input type="button" id='submit' value='SAVE' onclick='abc()' />
  </body>
</html>