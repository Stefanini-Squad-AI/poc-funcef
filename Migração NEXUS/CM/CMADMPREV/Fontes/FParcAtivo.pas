// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// -----------------------------------------------------------------------------
//Alterações  : .DFM
//Pendência   : SIG33744  (SOL 231442/18314)
//Responsável : BRUNO AZEVEDO DOS SANTOS
//Data MERGE  : 05/07/2022
//Data        : 27/07/2018
//Descrição   : Atualização do numero do processo do INSS e do status na tabela
//              de controle de dívida de benefícios.
//              ajuste para marcar a opção "Não" no flag Atualizar Saldo Devedor
// -----------------------------------------------------------------------------
//Pendência   : SOL 174933 KINTANA 1733374
//Responsável : Douglas Siqueira
//Data        : 10/01/2014
//Descrição   : Controle de Saldo devedor.



unit FParcAtivo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, TREdit, Spin, Db, DBTables, Wwquery, wwdblook,
  Grids, Wwdbigrd, Wwdbgrid, Wwdatsrc,UMensErro;

type
  TFrmParcAtivo = class(TfrmOkCancelar)
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    lbl1: TLabel;
    edtSalRevis: TEdit;
    dbgrdDet: TwwDBGrid;
    mmo1: TMemo;
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    dsDet: TwwDataSource;
    lbl2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExecutaConsultaAtivos(_idpessoa,_idtitular:string);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    dTotalCreditos : double;
    dTotalDebitos  : double;
  public
    { Public declarations }
  end;

var
  FrmParcAtivo: TFrmParcAtivo;


implementation

uses uDataBase;

{$R *.DFM}


procedure TFrmParcAtivo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  inherited;

end;

procedure TFrmParcAtivo.ExecutaConsultaAtivos(_idpessoa,
  _idtitular: string);

begin


qryDet.Active:=false;
qryDet.Sql.Clear;                 

//edilaine - SIG3744 - inicio
qryDet.SQL.Add('SELECT ''S'' S,');
qryDet.SQL.Add('       C.MESINICIO,');
qryDet.SQL.Add('       C.MESFIM,');
qryDet.SQL.Add('       C.SALDODEVEDORATUAL,');
qryDet.SQL.Add('       C.QTDEPARCELAS,');
qryDet.SQL.Add('       C.QUANTIDADEPARCELASPAGAS,');
qryDet.SQL.Add('      (C.QTDEPARCELAS - C.QUANTIDADEPARCELASPAGAS), C.IDCONTROLEDIVIDABENEFICIO, C.FONTEPAGADORA, ');
qryDet.SQL.Add('       decode(C.FONTEPAGADORA,1,''Funcef'',2,''INSS'')SFONTEPAGADORA, C.IDBENEFICIO, C.IDPLANOPREV,');
qryDet.SQL.Add('       C.IDTITULAR, C.IDPESSOA, C.IDPESSJUR, decode(C.FONTEPAGADORA,1, P.NOME, '''') AS PLANO');
//qryDet.SQL.Add('       (QTDEPARCELAS - QUANTIDADEPARCELASPAGAS),IDCONTROLEDIVIDABENEFICIO,FONTEPAGADORA,IDBENEFICIO,IDPLANOPREV,IDTITULAR,IDPESSOA,IDPESSJUR');
qryDet.SQL.Add(' FROM CONTROLEDIVIDABENEFICIO C');
qryDet.SQL.Add(' JOIN PLANPREV P ON P.IDPLANOPREV = C.IDPLANOPREV ');
qryDet.SQL.Add('WHERE FLGQUITADO=0 AND SALDODEVEDORATUAL>0');
qryDet.SQL.Add('AND IDPESSOA = '+_idpessoa);
qryDet.SQL.Add('AND IDTITULAR = '+_idtitular);
qryDet.SQL.Add('AND EXISTS (SELECT 1 ');
qryDet.SQL.Add('              FROM benefplanprev bpp ');
qryDet.SQL.Add('             WHERE p.idplanoprev = bpp.idplanoprev) ');
qryDet.SQL.Add('AND EXISTS (SELECT 1 ');
qryDet.SQL.Add('            FROM Planprevpatro ppt ');
qryDet.SQL.Add('            WHERE ppt.idplanoprev = p.idplanoprev ');
qryDet.SQL.Add('            AND ppt.idpessjur =  c.idpessjur ) ');
//edilaine - SIG3744 - fim
qryDet.SQL.Add('ORDER BY SALDODEVEDORATUAL');
qryDet.OPEN;

end;



procedure TFrmParcAtivo.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
qrydet.Filter:='S ='+#39+'S'+#39;
qrydet.Filtered:=True;
qrydet.Active:=True;
qrydet.First;
if qrydet.IsEmpty then
   begin
   MsgDlg('É necessário selecionar pelo menos um parcelamento ativo.','Erro',mtError,[mbOk,mbHelp],0);
   qrydet.Filtered:=false;
   Exit;
   end;
qrydet.Filtered:=false;
end;

procedure TFrmParcAtivo.FormActivate(Sender: TObject);
begin
  inherited;
dbgrdDet.Columns[1].readonly:=True;
dbgrdDet.Columns[2].readonly:=True;
dbgrdDet.Columns[3].readonly:=True;
dbgrdDet.Columns[4].readonly:=True;
dbgrdDet.Columns[5].readonly:=True;
dbgrdDet.Columns[6].readonly:=True;
end;

end.
