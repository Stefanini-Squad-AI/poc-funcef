{
--------------------------------------------------------------------------------
Pendência   : SOL 213592 Kintana 2040335
Responsável : Sadi Freire
Data        : 16/12/2013
Descrição   : Alterações Voto Empréstimo
----------------------------------------------------------------------------------

}


unit FCadastroCSImob;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, CmEventosCadastro, ImgList,
  CMDateTimePicker;

type
  TfrmCadastroCSImob = class(TfrmCadastroCS)
    btnRefresh: TToolbarButton97;
    btnTrazer: TToolbarButton97;
    ToolbarSep972: TToolbarSep97;
    ToolbarSep973: TToolbarSep97;
    ToolbarSep974: TToolbarSep97;
    ToolbarSep975: TToolbarSep97;

    procedure btnRefreshClick(Sender: TObject);
    procedure btnTrazerClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnApagarClick(Sender: TObject);

  protected { Private declarations }

   procedure FazerRefresh; virtual;
   procedure FazerTrazer; virtual;
   procedure FechaQueries; dynamic;


  private { Private declarations }

  public { Public declarations }

  end;



var
  frmCadastroCSImob: TfrmCadastroCSImob;



implementation
{$R *.DFM}



procedure TfrmCadastroCSImob.FazerRefresh;
begin
   // ------------------------------------
   //    implementação nos descendentes
   // ------------------------------------
end;



procedure TfrmCadastroCSImob.FazerTrazer;
begin
   // ------------------------------------
   //    implementação nos descendentes
   // ------------------------------------
end;



procedure TfrmCadastroCSImob.btnRefreshClick(Sender: TObject);
begin
   inherited;

   try
      FazerRefresh;
   finally
      // não deixa o botão ficar pressionado
      btnRefresh.Down := False;
   end;
end;



procedure TfrmCadastroCSImob.FechaQueries;
var
   i : integer;
begin
   i := 0;

   while i <= (ComponentCount - 1) do begin

      if ( (TObject(Components[i]).ClassType = TwwQuery) and (TwwQuery(Components[i]).Active) ) then begin
         TwwQuery(Components[i]).Close;
      end;

      inc(i);
   end;
end;



procedure TfrmCadastroCSImob.btnTrazerClick(Sender: TObject);
begin
   inherited;

   try
      FazerTrazer;
   finally
      // não deixa o botão ficar pressionado
      btnTrazer.Down := False;
   end;
end;



procedure TfrmCadastroCSImob.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FechaQueries;
   inherited;
end;



procedure TfrmCadastroCSImob.sbtnApagarClick(Sender: TObject);
begin
   try
      inherited;
   finally
      sbtnApagar.Down := False;
   end;
end;



end.
