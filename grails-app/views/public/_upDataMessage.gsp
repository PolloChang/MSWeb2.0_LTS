<table class="table table-bordered">
    <colgroup>
        <col width="20%">
        <col width="30%">
        <col width="20%">
        <col width="30%">
    </colgroup>
    <tbody>
    <tr>
        <th class="table-secondary text-right" scope="row">
            資料異動紀錄
        </th>
        <td colspan="3">
            <g:formatDate format="yyyy-MM-dd HH:mm:ss" date="${instance?.dateCreated}"/>由${instance?.manCreated}建立<BR/>
            <g:formatDate format="yyyy-MM-dd HH:mm:ss" date="${instance?.lastUpdated}"/>由${instance?.manLastUpdated}更新<BR/>
            資料版本：${instance?.version}
        </td>
    </tr>
    </tbody>
</table>
