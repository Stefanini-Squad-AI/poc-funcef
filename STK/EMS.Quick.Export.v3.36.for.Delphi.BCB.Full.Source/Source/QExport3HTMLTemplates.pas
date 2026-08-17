unit QExport3HTMLTemplates;

{$I VerCtrl.inc}

{ Standart HTML templates for TVHTMLExport component }

interface

uses {$IFNDEF NOGUI}
       {$IFDEF WIN32}Graphics{$ENDIF}
       {$IFDEF LINUX}QGraphics{$ENDIF}
     {$ELSE}
       QExport3Graphics
     {$ENDIF};

type

  RHTMLTemplate = record
    RBackgroundColor: TColor;
    RLinkColor: TColor;
    RVLinkColor: TColor;
    RALinkColor: TColor;
    RDefaultTextColor: TColor;
    RTextFontName: string;
    RHeadersRowBgColor: TColor;
    RHeadersRowFontColor: TColor;
    RTableBgColor: TColor;
    RTableFontColor: TColor;
    ROddRowBgColor: TColor;
  end;

const

 RhtMurky: RHTMLTemplate = (
   RBackgroundColor: $00767631;
   RLinkColor: $0060E7FF;
   RVLinkColor: $0039CCCC;
   RALinkColor: $0000FFFF;
   RDefaultTextColor: $00FFFFFF;
   RTextFontName: 'Arial';
   RHeadersRowBgColor: $0093933A;
   RHeadersRowFontColor: $00FFFFFF;
   RTableBgColor: $00626227;
   RTableFontColor: $0060E7FF;
   ROddRowBgColor: $00007836;
 );

 RhtBW: RHTMLTemplate = (
   RBackgroundColor: $00FFFFFF;
   RLinkColor: clRed;       //$000000FF;
   RVLinkColor: clPurple;     //$00800080;
   RALinkColor: clBlue;       // $00FF0000;
   RDefaultTextColor: clBlack; //$00000000;
   RTextFontName: 'Arial';
   RHeadersRowBgColor: $000000;
   RHeadersRowFontColor: $00FFFFFF;
   RTableBgColor: $00FFFFFF;
   RTableFontColor: clBlack;
   ROddRowBgColor: $00F3F3F3;
 );

 RhtClassic: RHTMLTemplate = (
   RBackgroundColor: $00993333;
   RLinkColor: $007DEF69;
   RVLinkColor: $00FF00FF;
   RALinkColor: $0000FF00;
   RDefaultTextColor: $00FFFFFF;
   RTextFontName: 'Arial';
   RHeadersRowBgColor: $000000FF;
   RHeadersRowFontColor: $00FFFFFF;
   RTableBgColor: $00EC7A00;
   RTableFontColor: $00FFFFFF;
   ROddRowBgColor: $00CE6B00;
 );

 RhtColorFul: RHTMLTemplate = (
   RBackgroundColor: $00669933;
   RLinkColor: $00CC6600;
   RVLinkColor: $00C13F92;
   RALinkColor: clBlue;
   RDefaultTextColor: clWhite;
   RTextFontName: 'Arial';
   RHeadersRowBgColor: $003300CC;
   RHeadersRowFontColor: $00FFFFFF;
   RTableBgColor: $00FFFFFF;
   RTableFontColor: clBlack;
   ROddRowBgColor: $0000F1FA;
 );

 RhtGray: RHTMLTemplate = (
   RBackgroundColor: $00FFFFFF;
   RLinkColor: clRed;
   RVLinkColor: clPurple;
   RALinkColor: clBlue;
   RDefaultTextColor: clBlack;
   RTextFontName: 'Arial';
   RHeadersRowBgColor: $00808080;
   RHeadersRowFontColor: clWhite;
   RTableBgColor: clWhite;
   RTableFontColor: clBlack;
   ROddRowBgColor: $00EEEEEE;
 );

 RhtMS_Money: RHTMLTemplate = (
   RBackgroundColor: clWhite;
   RLinkColor: clRed;
   RVLinkColor: clPurple;
   RALinkColor: clBlue;
   RDefaultTextColor: clBlack;
   RTextFontName: 'Arial';
   RHeadersRowBgColor: $00B5C6CE;
   RHeadersRowFontColor: clBlack;
   RTableBgColor: $00DEE7DE;
   RTableFontColor: clBlack;
   ROddRowBgColor: $00F0FBFF;
 );

 RhtOlive: RHTMLTemplate = (
   RBackgroundColor: clWhite;
   RLinkColor: clRed;
   RVLinkColor: clPurple;
   RALinkColor: clBlue;
   RDefaultTextColor: $005F605F;
   RTextFontName: 'Arial';
   RHeadersRowBgColor: $0090C8CF;
   RHeadersRowFontColor: clBlack;
   RTableBgColor: clWhite;
   RTableFontColor: $005F605F;
   ROddRowBgColor: $00CFFFFF;
 );

 RhtPlain: RHTMLTemplate = (
   RBackgroundColor: clWhite;
   RLinkColor: clRed;
   RVLinkColor: clPurple;
   RALinkColor: clBlue;
   RDefaultTextColor: clBlack;
   RTextFontName: 'Arial';
   RHeadersRowBgColor: $00E68F06;
   RHeadersRowFontColor: clWhite;
   RTableBgColor: clWhite;
   RTableFontColor: clBlack;
   ROddRowBgColor: $00D9FCFF;
 );


 RhtSimple: RHTMLTemplate = (
   RBackgroundColor: clWhite;
   RLinkColor: clRed;
   RVLinkColor: clPurple;
   RALinkColor: clBlue;
   RDefaultTextColor: $00804000;
   RTextFontName: 'Arial';
   RHeadersRowBgColor: $00996633;
   RHeadersRowFontColor: clWhite;
   RTableBgColor: clWhite;
   RTableFontColor: clBlack;
   ROddRowBgColor: $00CFFFFF;
 );


implementation

end.
