unit FParamRelaCalcContribAss;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook,
  CMDBLookupCombo, Mask, wwdbedit, Wwdbspin;

type
  TfrmParamRelaCalcContribAss = class(TfrmOkCancelar)
    Patrocinadora: TLabel;
    dblcpatro: TCMDBLookupCombo;
    label1: TLabel;
    dblcproduto: TCMDBLookupCombo;
    Label2: TLabel;
    Label3: TLabel;
    qrymes: TwwQuery;
    qrypatro: TwwQuery;
    qryproduto: TwwQuery;
    qryfilial: TwwQuery;
    GroupBox1: TGroupBox;
    dbsAno: TwwDBSpinEdit;
    cbmes: TComboBox;
    rdgFormaPgto: TRadioGroup;
    dblcfilial: TCMDBLookupCombo;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure rdgFormaPgtoClick(Sender: TObject);
  private
    { Private declarations }
    Procedure Fazqry;
  public
    { Public declarations }
  end;

var
  frmParamRelaCalcContribAss: TfrmParamRelaCalcContribAss;

implementation

{$R *.DFM}

uses dRelAssistencial, USistema, UMensErro, FAguarde;

procedure TfrmParamRelaCalcContribAss.FormCreate(Sender: TObject);
var AYear, AMonth, ADay: Word;
begin
  inherited;
  (* Preenche mês de referência e ano com data atual *)
  DecodeDate(Date, AYear, AMonth, ADay);
  if (AMonth >= 1) and (AMonth <= 12) then begin
    cbmes.ItemIndex := AMonth - 1;
    cbmes.Text := cbmes.Items[cbmes.ItemIndex];
    dbsAno.Text := IntToStr(AYear);
    dbsAno.Text := IntToStr(AYear);
  end;
  qrymes.Open;
  qrypatro.Open;
  qryproduto.Open;
  qryfilial.Open;
  rdgFormaPgto.ItemIndex := 1; (* Banco *)
end;

procedure TfrmParamRelaCalcContribAss.rdgFormaPgtoClick(Sender: TObject);
begin
  (* verifica se o usuário escolheu "Folha" *)
  if rdgFormaPgto.ItemIndex = 0 then begin
    dblcpatro.Text := 'SERPROS';
    dblcpatro.LookupValue := '1';
  end;(* if itemIndex = 0 *)
end;

procedure TfrmParamRelaCalcContribAss.Fazqry;
var vMes, vSQL : string;
    vIsSERPROS : boolean;
begin
  (* Exibe o frmAguarde mostrando a mensagem abaixo para o usuário *)
  frmAguarde.Mostra('Aguarde.  Montando relatório...');
  (* Verifica a empresa que o sistema está rodando é SERPROS *)
  if    (Pos('SERPRO',sistema.NomeEmpresa) > 0) then vIsSERPROS := true
  else vIsSERPROS := false;
  vSQL :=        ' SELECT'                                          +
                 '   RTRIM(PJ.NOME) AS PATROCINADORA,'              +
                 '   UPPER(PA.NOME) AS PLANO,'                      +
                 '   DECODE(PA.NOME,'+chr(39)+'Plano Dental Basico'          +chr(39)+','+chr(39)+'Plano Dental'  +chr(39)+','+
                                      chr(39)+'Plano Dental Basico + Protese'+chr(39)+','+chr(39)+'Plano Dental'  +chr(39)+','+
                                      chr(39)+'Plano Funeral'                +chr(39)+','+chr(39)+'Plano Funeral' +chr(39)+','+
                                      chr(39)+'Plano Saude Quarto Coletivo'  +chr(39)+','+chr(39)+'Plano Saúde'   +chr(39)+','+
                                      chr(39)+'Plano Saude Quarto Privativo' +chr(39)+','+chr(39)+'Plano Saúde'   +chr(39)+','+
                                      chr(39)+'Seguro de Vida'               +chr(39)+','+chr(39)+'Seguro de Vida'+chr(39)+') AS PRODUTO,'+
                 '   PPP.INSCRICAONUMERO AS INSCRICAO,'             +
                 '   UPPER(P.NOME) AS DEPENDENTE,'                  +
                 '   H.IDDEPENDENTE,'                               +
                 '   EP.MATRICULA,'                                 +
                 '   UPPER(PT.NOME) AS TITULAR,'                    +
                 '   H.VALORESPERADO AS VALOR,'                     +
                 '   H.MES AS MESREFERENCIA,'                       +
                 '   H.MESCOBRANCA,'                                +
                 '   RP.CODPROVDESC AS CODIGORUBRICA,'              +
                 '   DECODE(DT.IDDEPENDENCIA,''PRP'',0,1) AS TIT,'  +
                 '   UPPER(S.DESCRICAO) AS SITUACAO,'               +
                 '   S.FLGINTERNO,';
  if vIsSERPROS then
    vSQL := vSQL + '   DECODE(QRYPATRO.VLRPATRO,NULL,0,QRYPATRO.VLRPATRO) AS VLRPATRO,'
  else vSQL := vSQL + '   0 VLRPATRO ,';
  vSQL := vSQL + '   DECODE(H.FLGCOBCARNE,0,'+chr(39)+'Folha '+chr(39)+','+
                                              chr(39)+'Banco '+chr(39)+
                          ') || DECODE(S.FLGINTERNO,'+chr(39)+'AT'+chr(39)+', DECODE(H.FLGCOBCARNE,0,'+chr(39)+'de Pagamento'   +chr(39)+',' +
                                                                                                       chr(39)+'Débito em Conta'+chr(39)+'),'+
                                                      chr(39)+'AS'+chr(39)+', DECODE(H.FLGCOBCARNE,0,'+chr(39)+'de Benefício'   +chr(39)+',' +
                                                                                                       chr(39)+'Carnê'          +chr(39)+'),'+
                                                      chr(39)+'MA'+chr(39)+','+chr(39)+'Carnê'       +chr(39)+') AS PAG' +
                 ' FROM'                +
                 '   HSTCONTRIBASS H,'  +
                 '   PARTPREVPLAN PPP,' +
                 '   ELEGPATRO EP,'     +
                 '   PESSOA P,'         +
                 '   PESSOA PJ,'        +
                 '   PESSOA PT,'        +
                 '   PLANASS PA,'       +
                 '   CONTRIBASS CA,'    +
                 '   RUBRICAXPESS RP,'  +
                 '   DEPENTIT DT,'      +
                 '   SITPART S ';
  if CbMes.ItemIndex < 9 then
    vMes    := dbsAno.Text + '/0' + IntToStr(CbMes.ItemIndex+1)
  else vMes := dbsAno.Text + '/'  + IntToStr(CbMes.ItemIndex+1);
  if vIsSERPROS then begin
    (* Adiciona ao SQL o valor pago pela patrocinadora *)
    vSQL := vSQL+', (SELECT H2.VALORESPERADO AS VLRPATRO,' +
                 '          H2.IDPESSJUR,'                 +
                 '          H2.IDPLANOPREV,'               +
                 '          H2.IDTITULAR,'                 +
                 '          H2.IDDEPENDENTE,'              +
                 '          H2.IDPLANASS,'                 +
                 '          H2.MES,'                       +
                 '          H2.MESCOBRANCA'                +
                 '   FROM HSTCONTRIBASS H2'                +
                 '   WHERE H2.IDPAGADOR = 1'               +
                 '     AND MESCOBRANCA = ' + chr(39) + vMes + chr(39) + ') QRYPATRO';
  end;(* else vIsSERPROS *)
  vSQL := vSQL + ' WHERE ( H.IDTITULAR    = H.IDPAGADOR)'               +
                 '   AND ( H.IDTITULAR    = PPP.IDPESSOA)'              +
                 '   AND ( H.IDPESSJUR    = PPP.IDPESSJUR)'             +
                 '   AND ( H.IDPLANOPREV  = PPP.IDPLANOPREV)'           +
                 '   AND ( H.IDTITULAR    =  EP.IDPESSOA)'              +
                 '   AND ( H.IDPESSJUR    =  EP.IDPESSJUR)'             +
                 '   AND ( H.IDTITULAR    =  PT.IDPESSOA)'              +
                 '   AND ( H.IDDEPENDENTE =   P.IDPESSOA)'              +
                 '   AND ( H.IDPESSJUR    =  PJ.IDPESSOA)'              +
                 '   AND ( H.IDPLANASS    =  PA.IDPLANASS)'             +
                 '   AND ( H.IDPLANASS    =  CA.IDPLANASS)'             +
                 '   AND ( H.IDCONTASS    =  CA.IDCONTASS)';
  if vIsSERPROS then begin
    (* Adiciona ao SQL o valor pago pela patrocinadora *)
    vSQL := vSQL+'   AND ( H.IDTITULAR    =  QRYPATRO.IDTITULAR(+))'    +
                 '   AND ( H.IDPESSJUR    =  QRYPATRO.IDPESSJUR(+))'    +
                 '   AND ( H.IDDEPENDENTE =  QRYPATRO.IDDEPENDENTE(+))' +
                 '   AND ( H.IDPLANOPREV  =  QRYPATRO.IDPLANOPREV(+))'  +
                 '   AND ( H.IDPLANASS    =  QRYPATRO.IDPLANASS(+))'    +
                 '   AND ( H.MES          =  QRYPATRO.MES(+))'          +
                 '   AND ( H.MESCOBRANCA  =  QRYPATRO.MESCOBRANCA(+))';
  end;(* if vIsSERPROS *)
  vSQL := vSQL + '   AND (DT.IDTITULAR    =   H.IDTITULAR)'             +
                 '   AND (DT.IDPESSOA     =   H.IDDEPENDENTE)'          +
                 '   AND (CA.IDEMPRESA    =  RP.IDPESSOA(+))'           +
                 '   AND (CA.IDPROVENTO   =  RP.IDRUBRICA(+))'          +
                 '   AND (PPP.IDSITPART   =   S.IDSITPART)'             +
                 (* Cobrança do mês de refêrencia escolhido pelo usuário *)
                 '   AND (H.MES           = ' + chr(39) + vMes + chr(39) + ')';
  (* Filtro por forma de pagamento *)
  if rdgFormaPgto.ItemIndex = 0 then
    vSQL := vSQL+'   AND (H.FLGCOBCARNE   = 0)'
  else
    vSQL := vSQL+'   AND (H.FLGCOBCARNE   = 1)';
  (* Filtro por patrocinadora *)
  if Trim(dblcpatro.Text) <> '' then
    vSQL := vSQL+'   AND (H.IDPESSJUR     = ' + dblcpatro.LookupValue + ')';
  (* Filtro por produto *)
  if Trim(dblcproduto.Text) <> '' then
    vSQL := vSQL+'   AND (PA.IDPLANASS    = ' + dblcproduto.LookupValue + ')';
  (* Filtro por filial *)
  if Trim(dblcfilial.Text) <> '' then
    vSQL := vSQL+'   AND (EP.IDESTAB      = ' + dblcfilial.LookupValue  + ')';
    (* Ordenação *)
  vSQL := vSQL+  ' ORDER BY PJ.NOME,PAG,PRODUTO,PT.NOME,P.NOME';
  dtmRelAssistencial.qryRelaCalcContribAss.Close;
  dtmRelAssistencial.qryRelaCalcContribAss.SQL.Clear;
  dtmRelAssistencial.qryRelaCalcContribAss.SQL.Add(vSQL);
  dtmRelAssistencial.qryRelaCalcContribAss.Open;
  if dtmRelAssistencial.qryRelaCalcContribAss.IsEmpty then frmAguarde.Apaga;
end;

procedure TfrmParamRelaCalcContribAss.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  (* verifica se o usuário preencheu o mês de referência *)
  if CbMes.ItemIndex = -1 then begin
    MsgDlg('Escolha o Mês', 'Aviso', mtWarning, [mbOk], 0);
    cbMes.SetFocus;
    ModalResult := mrNone;
  end
  else begin
    Screen.Cursor := crHourGlass;
    (* Procedure que monta a Query para o relatório *)
    fazqry;
  end;
end;

procedure TfrmParamRelaCalcContribAss.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qrymes.Close;
  qrypatro.Close;
  qryproduto.Close;
  qryfilial.Close;
end;

procedure TfrmParamRelaCalcContribAss.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  dblcpatro.LookupValue   := '';
  dblcproduto.LookupValue := '';
  dblcfilial.LookupValue  := '';
  cbMes.ItemIndex         := -1;
  cbMes.SetFocus;
end;

end.
