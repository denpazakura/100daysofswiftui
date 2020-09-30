# Working with the Color struct

_# New Document


<table>
    <tr>
        <th>
            Code
        </th>
        <th>
            Result
        </th>
    </tr>
    <tr>
        <td>
            <pre>
                <br/><br/><br/>        VStack {
            ZStack {
                Text(text)
            }
            .background(moonSlivers)
        }<br/><br/><br/><br/><br/>
            </pre>
        </td>
        <td>
<img width="300" alt="textbackground" src="https://user-images.githubusercontent.com/29441465/94733236-bea60c00-0367-11eb-9022-b5acb247d978.png"> 
    </tr>
    <tr>
        <td>
            <pre>
                <br/><br/><br/>        VStack {
            ZStack {
                Text(text)
                    .background(moonSlivers)
            }
        }<br/><br/><br/><br/><br/>
            </pre>
        </td>
        <td>
<img width="300" alt="textbackground2" src="https://user-images.githubusercontent.com/29441465/94733397-fd3bc680-0367-11eb-8f0e-e281c23586ca.png">
    </tr>
      </tr>
    <tr>
        <td>
            <pre>
                <br/><br/><br/>         VStack {
             ZStack {
                moonSlivers
                Text(text)
             }
         }<br/><br/><br/><br/><br/>
            </pre>
        </td>
        <td>
<img width="300" alt="textbackground3" src="https://user-images.githubusercontent.com/29441465/94733624-586db900-0368-11eb-88ba-76dfb9078d32.png">
    </tr>
        </tr>
      </tr>
    <tr>
        <td>
            <pre>
                <br/><br/><br/>         VStack {
            ZStack {
                moonSlivers.edgesIgnoringSafeArea(.all)
                Text(text)
             }
         }<br/><br/><br/><br/><br/>
            </pre>
        </td>
        <td>
<img width="300" alt= textbackground4" src="https://user-images.githubusercontent.com/29441465/94733628-5a377c80-0368-11eb-817d-196d78ac0851.png">
    </tr>
</table>
