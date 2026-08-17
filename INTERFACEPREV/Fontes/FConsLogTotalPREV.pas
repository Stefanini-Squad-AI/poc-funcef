// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Claudio Faria
// Rotina      : Varias
// Data        : 21/08/2007
// Pendência   : 22108
// Alteração   : Troca do DateToStr para FormatDateTime.
// -----------------------------------------------------------------------------
// Autor       : Leo
// Data        : 22/11/2005
// Pendência   : 20785
// Alteração   : modificação da chamada e aparência da tela
//------------------------------------------------------------------------------
// Autor       : Flavio Dias
// Data        : 12.02.2004
// Alteração   : Acerto na busca com preenchimento de caracter - pendência 16094
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 26.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 26.06.2003
// Alteração   : Inclusao da opcao de filtrar por texto da operacao
//------------------------------------------------------------------------------
unit FConsLogTotalPREV;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, Db, DBTables, Wwquery, wwdblook,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls,
  Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, wwdbdatetimepicker,
  CMDateTimePicker;

type
  TfrmConsLogTotalPREV = class(TfrmSairAjuda)
    GroupBox1: TGroupBox;
    lblmodulo: TLabel;
    dblkpcmbModulo: TwwDBLookupCombo;
    qryModulo: TwwQuery;
    bbtnProcurar: TBitBtn;
    qryOperacoes: TwwQuery;
    wwDBGrid1: TwwDBGrid;
    dsOperacoes: TwwDataSource;
    Label3: TLabel;
    edOperacao: TEdit;
    Label4: TLabel;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    dtData: TCMDateTimePicker;
    Label5: TLabel;
    dtdatafim: TCMDateTimePicker;
    procedure FormShow(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure wwDBGrid1TitleButtonClick(Sender: TObject;
      AFieldName: String);
  private
    { Private declarations }
    sSql : String;
  public
     procedure ConsultaLogTotalPrev(iIdModulo : Integer);
    { Public declarations }
  end;

var
  frmConsLogTotalPREV: TfrmConsLogTotalPREV;

implementation

{$R *.DFM}

procedure TfrmConsLogTotalPREV.FormShow(Sender: TObject);
begin
  inherited;
  qryOperacoes.Close;
  qryOperacoes.Open;

  dtData.Text      := FormatDateTime('dd/mm/yyyy', date);
  dtDatafim.Text   := FormatDateTime('dd/mm/yyyy', date);
end;

procedure TfrmConsLogTotalPREV.bbtnProcurarClick(Sender: TObject);
var sSQLAux : string;
begin
  inherited;


  if dtdata.text <> '' then
  begin
    sSQLAux := ' AND  TRUNC(L.DATA) >= TO_DATE('''+dtData.Text+''', ''DD/MM/YYYY'')   ';
  end;

  if dtdatafim.text <> '' then
  begin
    sSQLAux := sSQLAux +' AND  TRUNC(L.DATA) <= TO_DATE('''+dtDatafim.Text+''', ''DD/MM/YYYY'')   ';
  end;

  if Trim(dblkpcmbModulo.Text) <> '' then
  begin
    sSQLAux := sSQLAux +' AND L.IDMODULO = '+qryModulo.FieldByName('IdModulo').AsString;
  end;

  if Trim(edOperacao.Text) <> '' then
    sSQLAux := sSQLAux +' AND L.DESCOPERACAO LIKE ' + QuotedStr('%'+ edOperacao.Text +'%');

  with qryOperacoes  do
  begin
    Close;
    SQL.Clear;
    SQL.Add(' SELECT U.NOMEUSUARIO, M.NOMEMODULO, L.DATA, L.DESCOPERACAO '+
            ' FROM   LOGTOTALPREV L, USUARIOSISTEMA U, MODULO M          '+
            ' WHERE  L.IDMODULO   = M.IDMODULO   '+
            ' AND    L.IDUSUARIO  = U.IDUSUARIO  '+sSQLAux);

    sSql := qryOperacoes.sql.text;

    Open;
  end;
end;


procedure tfrmConsLogTotalPREV.ConsultaLogTotalPrev(iIdModulo : Integer);
begin
   Application.CreateForm(TfrmConsLogTotalPREV, frmConsLogTotalPREV);

   frmConsLogTotalPREV.qryModulo.Close;
   frmConsLogTotalPREV.qryModulo.Open;

   frmConsLogTotalPREV.dblkpcmbModulo.visible := true;
   frmConsLogTotalPREV.lblmodulo.visible := true;

   if iIdModulo > 0 then
   begin
      if frmConsLogTotalPREV.qrymodulo.locate('IDMODULO',iIdModulo,[loCaseInsensitive]) then
      begin
         frmConsLogTotalPREV.dblkpcmbModulo.visible := false;
         frmConsLogTotalPREV.lblmodulo.visible := false;
         frmConsLogTotalPREV.dblkpcmbModulo.Text := frmConsLogTotalPREV.qrymodulo.fieldbyname('NOMEMODULO').AsString;
      end
   end;

end;

procedure TfrmConsLogTotalPREV.wwDBGrid1TitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  inherited;
  qryOperacoes.close;
  qryOperacoes.sql.clear;
  qryOperacoes.sql.add(sSql + 'ORDER BY '+AFieldName+' ');
  qryOperacoes.open;
end;

end.
