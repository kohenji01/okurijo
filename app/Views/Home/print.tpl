<!DOCTYPE html>
<html lang="ja">
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
  <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-ui-timepicker-addon/1.6.3/jquery-ui-timepicker-addon.min.css">
  <style>
      /* 日本語フォント追加 */
      html, body {
          font-family: -apple-system, BlinkMacSystemFont, Roboto, Meiryo, "游ゴシック Medium", "Yu Gothic Medium", "游ゴシック体", YuGothic, "Hiragino Kaku Gothic ProN", "Helvetica Neue",Helvetica,Arial,sans-serif,'Glyphicons Halflings';
          font-feature-settings: "palt";/* 文字間を狭くする */
          color: black!important;
      }

      /* MSIEは游ゴを使うと勝手に余白が入る。IEだけMeiryoを先に読ませるか、個別に余白調整が必要 */
      @media all and (-ms-high-contrast:none) {
          html, body {
              font-family: -apple-system,BlinkMacSystemFont, Roboto, Meiryo, Yu Gothic Medium, "游ゴシック Medium", "游ゴシック体", YuGothic, "Hiragino Kaku Gothic ProN", "Helvetica Neue",Helvetica,Arial,sans-serif,'Glyphicons Halflings';
          }
      }

      /* A4縦用のベース設定 */
      @page {
          size: A4 portrait; /* 横の場合はlandscape */
          margin: 0mm;
      }
      /* 各要素の余白リセット */
      *{
          margin: 0mm;
          padding: 0mm;
      }
      /* 印刷時の調子を整える */
      body {
          width: 210mm; /* 用紙の横幅を改めて指定 Chrome用 */
          -webkit-print-color-adjust: exact;
          color-adjust: exact;
          line-height: 1.5em;
      }
      /* 印刷1ページ用のコンテンツはここで定義 */
      .page {
          width: 210mm; /* 用紙の横幅を改めて指定 */
          height: 296.5mm;/* 高さには0.5mm余裕をもたせる */
          page-break-after: always;
          box-sizing: border-box;
          padding: 5mm 25mm 35mm 25mm;/* 用紙の余白 */
          font-size: 11pt;
      }
      textarea {
          resize: none;
      }
      .table-bordered td, .table-bordered th {
          border:black 1px solid!important;
      }

      /* プレビュー用のスタイル */
      @media screen {
          body {
              background: #eee;
          }
          .page {
              background: white; /* 背景を白く */
              box-shadow: 0 .5mm 2mm rgba(0,0,0,.3); /* ドロップシャドウ */
              margin: 5mm;
          }
      }

      /* WEBブラウズでは消す */
      .print_button,.print_form { display: none;}

      @media print{
          /* 印刷ではボタンを消す */
          .un_print_button,.un_print_form { display: none;}
          .print_button,.print_form { display: block;}

          /* Bootstrapが印刷サイズを調整しているので、再調整 */
          body {
              /* for chrome */
              width: 210mm!important;
              /* for chrome */
              min-width: auto !important;
          }
          .table-bordered td {
              font-family: "YuMincho", "Hiragino Mincho ProN", "Yu Mincho", "MS PMincho", serif;
          }
      }
  </style>
  <title>サラシステムズ：送り状</title>
</head>

<body>
{*<pre>{$data|print_r}</pre>*}

<section class="page" style="position: relative;">

  <div class="row mt-4 mb-5">
    <div class="col-7 text-left" style="font-size: 0.9rem;line-height: 1.3rem;">
        〒{$data.zipcode}<br>
        {$data.prefectures}{$data.add01}<br>
        {$data.add02}<br>
        {$data.company}<br>
        {$data.department}<br>
        {$data.katagaki}<br>
      <span style="font-size: 1rem;">{$data.last_name}{$data.first_name}　様</span>
    </div>
    <div class="col-5 text-right" style="font-size: 0.9rem;line-height: 1.3rem;">
      <img src="/sarahlogo.png" alt="" style="width: 100%;"><br>
      <div class="text-center my-1">
        合資会社サラシステムズ
      </div>
      <div class="text-left mb-1">
        〒165-0032<br>
        東京都中野区鷺宮5-20-12
      </div>
      Phone 03-5848-8951<br>
      FAX 03-5848-8953
    </div>
  </div>

  <div class="row my-5 pt-5">
    <div class="col-12 text-center h3 mb-5 pt-5">請求書送付のご案内</div>

    <div class="text-left mb-3 px-3 " style="font-size: 1.1rem;line-height: 1.7rem;">
      拝啓　時下益々ご清栄のこととお喜び申し上げます。<br>
      平素は格別のお引き立てを賜わり誠に有難うございます。<br>
      さて、先日納品させていただきました分の請求書をお送り致します。<br>
      今後ともよろしくお願い致します。<br>
    </div>
  </div>

  <div class="text-right my-5 px-3" style="font-size: 1.1rem;">
    敬　具
  </div>


  <!-- 上部ボタン -->
  <div class="text-right text-nowrap un_print_button" style="position: absolute;z-index: 2;top:0;left:220mm;">
    <a href="/" class="btn btn-secondary mb-2" role="button"><i class="fas fa-backward"></i>&nbsp;戻る</a><br>
    <a onclick="{literal}window.print();{/literal}" class="btn btn-success" role="button"><span class="text-white"><i class="fas fa-print"></i>&nbsp;印刷</span></a>
  </div>

  <div class="text-left text-nowrap" style="position: absolute;z-index: 2;top:110mm;left:5mm;">
    <span>--</span>
  </div>
  <div class="text-left text-nowrap" style="position: absolute;z-index: 2;top:210mm;left:5mm;">
    <span>--</span>
  </div>

</section><!-- ページ単位 -->
</body>
</html>
