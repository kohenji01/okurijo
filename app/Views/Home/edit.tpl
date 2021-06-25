<form method="post" action="/Home/edit/{$id}{if $seq!==null}/{$seq}{/if}">
    <ul>
        <li><label>顧客 姓<input type="text" name="send[last_name]" value="{$data.last_name}"></label></li>
        <li><label>顧客 名<input type="text" name="send[first_name]" value="{$data.first_name}"></label></li>
        <li><label>郵便番号<input type="text" name="send[zipcode]" value="{$data.zipcode}"></label></li>
        <li><label>都道府県<input type="text" name="send[prefectures]" value="{$data.prefectures}"></label></li>
        <li><label>住所1<input type="text" name="send[add01]" value="{$data.add01}"></label></li>
        <li><label>住所2<input type="text" name="send[add02]" value="{$data.add02}"></label></li>
        <li><label>会社名<input type="text" name="send[company]" value="{$data.company}"></label></li>
        <li><label>部署<input type="text" name="send[department]" value="{$data.department}"></label></li>
        <li><label>肩書き<input type="text" name="send[katagaki]" value="{$data.katagaki}"></label></li>
        <li><label>電話<input type="text" name="send[tel]" value="{$data.tel}"></label></li>
        <li><label>FAX<input type="text" name="send[fax]" value="{$data.fax}"></label></li>
        <li><label>印刷<input type="text" name="send[print]" value="{$data.print}"></label></li>
    </ul>
    <button type="submit">保存</button>
</form>