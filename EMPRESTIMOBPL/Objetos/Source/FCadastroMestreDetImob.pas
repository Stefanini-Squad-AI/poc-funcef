unit FCadastroMestreDetImob;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls,
  CmEventosCadastro, ImgList;

type
  TfrmCadastroMestreDetImob = class(TfrmCadMestreDetalheCS)
    btnRefresh: TToolbarButton97;
    btnTrazer: TToolbarButton97;
    ToolbarSep972: TToolbarSep97;
    ToolbarSep973: TToolbarSep97;
    ToolbarSep974: TToolbarSep97;
    ToolbarSep975: TToolbarSep97;

    procedure tbcDetalheChange(Sender: TObject);
    procedure tbcDetalheChanging(Sender: TObject; var AllowChange: Boolean);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnTrazerClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnApagarClick(Sender: TObject);

  protected { Protected declarations }
    grdDetalheAtual    : TwwDBGrid;
    qryDetalheAtual    : TwwQuery;

    procedure FazerRefresh; virtual;
    procedure FazerTrazer; virtual;
    procedure FechaQueries; virtual;

  private { Private declarations }

  public { Public declarations }

  end;



var
  frmCadastroMestreDetImob: TfrmCadastroMestreDetImob;



implementation
{$R *.DFM}



procedure TfrmCadastroMestreDetImob.FazerRefresh;
begin
   // ------------------------------------
   //    implementação nos descendentes
   // ------------------------------------
end;



procedure TfrmCadastroMestreDetImob.FazerTrazer;
begin
   // ------------------------------------
   //    implementação nos descendentes
   // ------------------------------------
end;



procedure TfrmCadastroMestreDetImob.FechaQueries;
var
   i : integer;
begin
   for i := 0 to (ComponentCount - 1) do begin
      if ( (TObject(Components[i]).ClassType = TwwQuery) and (TwwQuery(Components[i]).Active) ) then begin
         TwwQuery(Components[i]).Close;
      end;
   end;
end;



procedure TfrmCadastroMestreDetImob.tbcDetalheChange(Sender: TObject);
begin
   Repaint;

   inherited;

   // código para replicar o controle de query detalhe atual (presente no CadMestreDetalheCS):
   // a variável do pai que tem a mesma função não está disponível para os filhos
   grdDetalheAtual := TwwDBGrid(TComponent(sender).Owner.FindComponent(tbcDetalhe.detdbGrids[tbcDetalhe.TabIndex]));
   if grdDetalheAtual <> nil then begin
      qryDetalheAtual	:= TwwQuery(grdDetalheAtual.DataSource.DataSet);
   end else begin
      qryDetalheAtual	:= nil;
   end;
end;



procedure TfrmCadastroMestreDetImob.tbcDetalheChanging(Sender: TObject; var AllowChange: Boolean);
begin
   CmeDetalhe.Cancel(Self);

   inherited;
end;



procedure TfrmCadastroMestreDetImob.btnRefreshClick(Sender: TObject);
begin
   inherited;

   try
      FazerRefresh;
   finally

      // não deixa o botão ficar pressionado
      btnRefresh.Down := False;
   end;
end;



procedure TfrmCadastroMestreDetImob.btnTrazerClick(Sender: TObject);
begin
   inherited;

   FazerTrazer;

   // não deixa o botão ficar pressionado
   btnTrazer.Down := False;
end;



procedure TfrmCadastroMestreDetImob.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FechaQueries;
   inherited;
end;



procedure TfrmCadastroMestreDetImob.sbtnApagarClick(Sender: TObject);
begin
   try
      inherited;
   finally
      sbtnApagar.Down := False;
   end;
end;



end.
