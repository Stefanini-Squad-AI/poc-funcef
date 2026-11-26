{====>   DESENVOLVEDOR NÃO ESQUEÇA DE COMENTAR SUAS ALTERAÇÕES AO LONGO DO
         CÓDIGO, ASSIM COMO COLOCAR A DESCRIÇÃO DA IMPLEMENTAÇÃO/ALTERAÇÃO
         NO HISTÓRICO DE ALTERAÇÕES NO FINAL DESTE ARQUIVO ********************}
unit FConsultaEstorno;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, MontaSelect, FSairAjuda, TB97Ctls, Db,
  DBTables, Wwquery, wwdbdatetimepicker, CMDateTimePicker, ComCtrls, TREdit,
  wwdblook, Grids, Wwdbigrd, Wwdbgrid, Wwdatsrc, DBGrids, FTelaAut,
  uDataBase, uSistema, dBaseDados;

type
  TfrmConsultaEstorno = class(TfrmOkCancelar)
    pnlSelecaoEstorno: TPanel;
    qryEstorno: TwwQuery;
    lblPatrocinadora: TLabel;
    lblTitular: TLabel;
    lblMatricula: TLabel;
    lblRecebedor: TLabel;
    lblInscricao: TLabel;
    lblVersao: TLabel;
    QryPatrocinadora: TwwQuery;
    QryPatrocinadoraIDPESSOA: TFloatField;
    QryPatrocinadoraNOME: TStringField;
    dbcmbPatrocinadora: TwwDBLookupCombo;
    edtRecebedor: TEdit;
    edtTitular: TEdit;
    dbcmbVersao: TwwDBLookupCombo;
    btnConsulta: TBitBtn;
    grpPeriodo: TGroupBox;
    lblDtInicial: TLabel;
    lblDataFinal: TLabel;
    qryVersao: TwwQuery;
    edtDtInicio: TwwDBDateTimePicker;
    edtDtFim: TwwDBDateTimePicker;
    pnlResultado: TPanel;
    pnlTituloResultado: TPanel;
    pnlEstorno: TPanel;
    pnlRubrica: TPanel;
    pnlTituloEstorno: TPanel;
    pnlTituloRubrica: TPanel;
    dtsEstorno: TwwDataSource;
    dbgrdEstorno: TDBGrid;
    qryVersaoHISTORICO: TStringField;
    qryVersaoIDHSTFOLHABENEF: TFloatField;
    edtInscricao: TEdit;
    edtMatricula: TEdit;
    dbgrdRubrica: TDBGrid;
    qryPlano: TwwQuery;
    qryPlanoIDPLANOPREV: TFloatField;
    qryPlanoNOME: TStringField;
    lblPlano: TLabel;
    dbcmbPlano: TwwDBLookupCombo;
    qryRubrica: TwwQuery;
    dtsRubrica: TwwDataSource;
    spbExpandeMotivo: TSpeedButton;
    wwQuery1: TwwQuery;
    StringField1: TStringField;
    FloatField1: TFloatField;
    StringField2: TStringField;
    StringField3: TStringField;
    FloatField2: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure btnConsultaClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure edtInscricaoKeyPress(Sender: TObject; var Key: Char);
    procedure edtMatriculaKeyPress(Sender: TObject; var Key: Char);
    procedure edtTitularKeyPress(Sender: TObject; var Key: Char);
    procedure edtRecebedorKeyPress(Sender: TObject; var Key: Char);
    procedure spbExpandeMotivoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure qryEstornoAfterScroll(DataSet: TDataSet);
  private
    Procedure SqlQryRubrica;
    procedure HabilitaConsulta( bHabilita : Boolean );
    procedure MontaSQL;
    procedure AtualizaDados;
  public
    { Public declarations }
  end;

var
  frmConsultaEstorno: TfrmConsultaEstorno;

implementation

uses FMsg, uObjFolha;

{$R *.DFM}

procedure TfrmConsultaEstorno.FormCreate(Sender: TObject);
begin
  inherited;

  (* Prepara o sql da qryRubrica *)
  SqlQryRubrica;
  //Abertura das queries dos combos de parametrização.
  qryPatrocinadora.Open;
  qryVersao.Open;
  qryPlano.Open;

  WindowState := wsMaximized;

  HabilitaConsulta( True );
end;

procedure TfrmConsultaEstorno.btnConsultaClick(Sender: TObject);
begin
  inherited;
  HabilitaConsulta( False );
end;

Procedure TfrmConsultaEstorno.SqlQryRubrica;
Var sSql: String;
begin
  sSql:='SELECT H.MES, DECODE(PD.FLGESPECIAL,0, '+
        ' DECODE(PD.FLGDESCONTO, 0, ''P'', 1, ''D'', ''I'' ), ''I'') AS ESTADO, '+
        ' DECODE(H.VALORPROVENTO,0,H.VALORINFO,H.VALORPROVENTO) AS VALOR, ';
  If SistemaFolha.FlgUsaCodRubExt = 0 then
    sSql:=sSql+' PD.IDPROVENTO AS CODIGO, PD.DESCRICAO AS RUBRICA '
  else sSql:=sSql+' PD.CODPROVDESC AS CODIGO, DESCRPROVDESC AS RUBRICA ';
  sSql:=sSql+' FROM HISTRUBSAL H, PROVDESC PD '+
             ' WHERE '+
             ' (H.IDRUBRICA = PD.IDPROVENTO) AND '+
             ' (H.IDPATRO = :IDPESSJUR) AND '+
             ' (H.IDHSTFOLHABENEF = :IDHSTFOLHABENEF) AND '+
             ' (H.IDTITULAR = :IDTITULAR) AND '+
             ' (H.IDRESPONSAVEL = :IDRECEBEDOR) AND '+
             ' (H.IDPLANOPREV = :IDPLANOPREV) '+
             ' ORDER BY H.SEQRUBRICA ';
  With qryRubrica do
  begin
    Close;
    Sql.Clear;
    Sql.Add(sSql);
    Params[0].DataType:=ftFloat;
    Params[1].DataType:=ftFloat;
    Params[2].DataType:=ftFloat;
    Params[3].DataType:=ftFloat;
    Params[4].DataType:=ftFloat;
  end; {With}
end;

procedure TfrmConsultaEstorno.HabilitaConsulta(bHabilita: Boolean);
//Prepara a tela para a consulta. O parâmetro bHabilita informa se a consulta
//será habilitada ou não. Caso não, já exibe os dados do resultado.
begin
  If bHabilita then
  begin
    qryEstorno.Close;
    qryRubrica.Close;
    pnlResultado.Visible := False;
  	pnlSelecaoEstorno.Enabled := True;
    dbcmbPatrocinadora.Clear;
	  dbcmbVersao.Clear;
	  edtTitular.Clear;
  	edtRecebedor.Clear;
	  edtInscricao.Clear;
  	edtMatricula.Clear;
	  edtDtInicio.Clear;
  	edtDtFim.Clear;
  end
  else
  begin
   	qryEstorno.Close;
    qryRubrica.Close;
    MontaSQL;
    qryEstorno.Open;
    AtualizaDados;
    qryRubrica.Open;
    pnlResultado.Visible := True;
   	pnlSelecaoEstorno.Enabled := False;
    spbExpandeMotivo.Enabled := not qryEstorno.IsEmpty;
    dbgrdEstorno.SetFocus;
  end;
end;

procedure TfrmConsultaEstorno.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  HabilitaConsulta( True );
end;

procedure TfrmConsultaEstorno.MontaSQL;
//Monta a query de consulta principal.
begin
	qryEstorno.SQL.Text :=
   ' SELECT                                                   ' + #13 +
   '   ME.IDHSTFOLHABENEF,                                    ' + #13 +
   '   ME.IDPESSJUR,                                          ' + #13 +
   '   ME.IDPLANOPREV,                                        ' + #13 +
   '   ME.IDTITULAR,                                          ' + #13 +
   '   ME.IDRECEBEDOR,                                        ' + #13 +
   '   ME.TIPOESTORNO,                                        ' + #13 +
   '   ME.DATAESTORNO,                                        ' + #13 +
   '   PJ.NOME as PATROCINADORA,                              ' + #13 +
   '   ME.MOTIVO,                                             ' + #13 +
   '   PP.INSCRICAONUMERO,                                    ' + #13 +
   '   E.MATRICULA,                                           ' + #13 +
   '   PT.NOME as TITULAR,                                    ' + #13 +
   '   PR.NOME as RECEBEDOR,                                  ' + #13 +
   '   HF.HISTORICO,                                          ' + #13 +
   '   PV.NOME as PLANO                                       ' + #13 +
   ' FROM                                                     ' + #13 +
   '    MOTIVOESTORNOFB ME,                                   ' + #13 +
   '    PESSOA PJ,                                            ' + #13 +
   '    PESSOA PT,                                            ' + #13 +
   '    PESSOA PR,                                            ' + #13 +
   '    PARTPREVPLAN PP,                                      ' + #13 +
   '    ELEGPATRO E,                                          ' + #13 +
   '    HSTFOLHABENEF HF,                                     ' + #13 +
   '    PLANPREV PV                                           ' + #13 +
   ' WHERE                                                    ' + #13 +
   '    ( ME.IDHSTFOLHABENEF  = HF.IDHSTFOLHABENEF     ) AND  ' + #13 +
   '    ( ME.IDRECEBEDOR		  = PR.IDPESSOA 			 (+) ) AND  ' + #13 +
   '    ( ME.IDPESSJUR		    = PP.IDPESSJUR       (+) ) AND  ' + #13 +
   '    ( ME.IDPESSJUR		    = E.IDPESSJUR        (+) ) AND  ' + #13 +
   '    ( ME.IDPESSJUR  			= PJ.IDPESSOA   		 (+) ) AND  ' + #13 +
   '    ( ME.IDTITULAR			  = PP.IDPESSOA   		 (+) ) AND  ' + #13 +
   '    ( ME.IDTITULAR			  = E.IDPESSOA     		 (+) ) AND  ' + #13 +
   '    ( ME.IDTITULAR 		    = PT.IDPESSOA        (+) ) AND  ' + #13 +
   '    ( ME.IDPLANOPREV		  = PP.IDPLANOPREV 	   (+) ) AND  ' + #13 +
   '    ( ME.IDPLANOPREV      = PV.IDPLANOPREV     (+) )      ' ;

	if dbcmbPatrocinadora.Text <> '' then
  	qryEstorno.SQL.Text := qryEstorno.SQL.Text +
     ' and ( ME.IDPESSJUR  = ' + IntToStr( qryPatrocinadoraIDPESSOA.AsInteger ) + ' ) ' ;

	if dbcmbVersao.Text <> '' then
  	qryEstorno.SQL.Text := qryEstorno.SQL.Text +
     ' and ( ME.IDHSTFOLHABENEF  = ' + IntToStr( qryVersaoIDHSTFOLHABENEF.AsInteger ) + ' ) ' ;

	if dbcmbPlano.Text <> '' then
  	qryEstorno.SQL.Text := qryEstorno.SQL.Text +
     ' and ( ME.IDPLANOPREV  = ' + IntToStr( qryPlanoIDPLANOPREV.AsInteger ) + ' ) ' ;

	if trim( edtTitular.Text ) <> '' then
  	qryEstorno.SQL.Text := qryEstorno.SQL.Text +
     ' and ( PT.NOME LIKE ''' + trim( edtTitular.Text ) + '%'' ) ' ;

	if trim( edtInscricao.Text ) <> '' then
  	qryEstorno.SQL.Text := qryEstorno.SQL.Text +
     ' and ( PP.INSCRICAONUMERO  = ' + trim( trim( edtInscricao.Text ) ) + ' ) ' ;

	if trim( edtMatricula.Text ) <> '' then
  	qryEstorno.SQL.Text := qryEstorno.SQL.Text +
     ' and ( E.MATRICULA = ' + QuotedStr( trim( edtMatricula.Text ) ) + ' ) ' ;

	if trim( edtRecebedor.Text ) <> '' then
  	qryEstorno.SQL.Text := qryEstorno.SQL.Text +
     ' and ( PR.NOME LIKE ''' + trim( edtRecebedor.Text ) + '%'' ) ' ;

	if trim( edtDtInicio.Text ) <> '' then
  	qryEstorno.SQL.Text := qryEstorno.SQL.Text +
     ' and ( ME.DATAESTORNO >= ' + QuotedStr( trim( edtDtInicio.Text ) ) + ' ) ';

	if trim( edtDtFim.Text ) <> '' then
  	qryEstorno.SQL.Text := qryEstorno.SQL.Text +
     ' and ( ME.DATAESTORNO <= ' + QuotedStr( trim( edtDtFim.Text ) ) + ' ) ';

end;

procedure TfrmConsultaEstorno.edtInscricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
	if ( StrScan( '0123456789', Key ) = nil ) and ( Ord( Key ) <> 8 ) then
  	Key := Char(0);
end;

procedure TfrmConsultaEstorno.edtMatriculaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
	if ( StrScan( '0123456789-', Key ) = nil ) and ( Ord( Key ) <> 8 ) then
  	Key := Char(0);
end;

procedure TfrmConsultaEstorno.edtTitularKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
	Key := Char( CharUpper( PChar( Key ) ) );
end;

procedure TfrmConsultaEstorno.edtRecebedorKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
	Key := Char( CharUpper( PChar( Key ) ) );
end;

procedure TfrmConsultaEstorno.spbExpandeMotivoClick(Sender: TObject);
begin
  inherited;
	frmMsg := TfrmMsg.Create(nil);
  try
  	frmMsg.Caption := 'Motivo do Estorno';
//    frmMsg.memMensagem.Lines.Text := qryEstorno.fieldbyname('MOTIVO').AsString; //Ádler
    frmmsg.Memo.Lines.Text := qryEstorno.fieldbyname('MOTIVO').AsString;
  	frmMsg.ShowModal;
  finally
    frmMsg.Free;
  end;

end;

procedure TfrmConsultaEstorno.FormShow(Sender: TObject);
begin
  inherited;
  if not dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.StartTransaction;

  if not Sistema.GravaLogOperacoes('Consulta de Estorno Processados.') then
    Raise Exception.Create('Não foi possível gravar o log.')
  else
    dtmBaseDados.dbBaseDados.Commit;
end;

procedure TfrmConsultaEstorno.qryEstornoAfterScroll(DataSet: TDataSet);
begin
  inherited;
  AtualizaDados;
end;

procedure TfrmConsultaEstorno.AtualizaDados;
begin
  edtTitular.Text   := qryEstorno.FieldByName('TITULAR').AsString;
  edtRecebedor.Text := qryEstorno.FieldByName('RECEBEDOR').AsString;
  edtInscricao.Text := qryEstorno.FieldByName('INSCRICAONUMERO').AsString;
  edtMatricula.Text := qryEstorno.FieldByName('MATRICULA').AsString;
  qryVersao.Locate('IDHSTFOLHABENEF', qryEstorno.FieldByName('IDHSTFOLHABENEF').AsInteger, []);
  qryPatrocinadora.Locate('IDPESSOA', qryEstorno.FieldByName('IDPESSJUR').AsInteger, []);
  qryPlano.Locate('IDPLANOPREV', qryEstorno.FieldByName('IDPLANOPREV').AsInteger, []);
  dbcmbPatrocinadora.LookupValue := qryEstorno.FieldByName('IDPESSJUR').AsString;
  dbcmbPlano.LookupValue         := qryEstorno.FieldByName('IDPLANOPREV').AsString;
  dbcmbVersao.LookupValue        := qryEstorno.FieldByName('IDHSTFOLHABENEF').AsString;
end;

end.
{==============================================================================|
| UNIT                       : FConsultaEstorno.pas
|
| DESCRIÇÃO FUNCIONAL        : Consultar dados sobre estornos segundo
|                              parametrização definida pelo usuário, gerando
|                              resultado na tela.
|
===============================================================================|
| DESENVOLVEDOR              : David Ayrolla dos Santos
|
| PERÍODO DE IMPLEMENTAÇÃO   : de 11/01/2001 a 17/01/2001
|
| VERSÃO PARA LIBERAÇÃO      : 3.02.12c
|
| CLIENTE                    : REFER
|
| DESCRIÇÃO DA IMPLEMENTAÇÃO : Criação da unit.
|
|==============================================================================|
| DESENVOLVEDOR              : David Ayrolla dos Santos
|
| PERÍODO DE IMPLEMENTAÇÃO   : de 06/03/2001 a 06/03/2001
|
| VERSÃO PARA LIBERAÇÃO      : 3.02.11e
|
| CLIENTE                    : FUNCEF
|
| DESCRIÇÃO DA IMPLEMENTAÇÃO : Alteração da query que traz os dados do estorno,
|                              para que sejam trazidos inclusive aqueles sem
|                              tiular, patrocinadora, plano ou responsável
|                              específicos.
|
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 12/04/2002 A 12/04/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12i                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ALTERAÇÃO NA QUERY QRYRUBRICA SUBSTITUINDO IDPESSJUR POR IDPATRO           |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: Sidnei B Marins.                                              |
| PERÍODO DE IMPLEMENTAÇÃO: DE 23/07/2002 A 23/07/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: FUNCEF  - Pendencia 7664.                                           |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Modificação para exibir código/descrição externa |                                                                              |
|  conforme a parametrização na tabela PARAMAPREV.                             |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE DD/MM/AAAA A DD/MM/AAAA                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (SE REQUISITO FOI PEDIDO POR UM CLIENTE ESPECÍFICO)                 |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|==============================================================================}

