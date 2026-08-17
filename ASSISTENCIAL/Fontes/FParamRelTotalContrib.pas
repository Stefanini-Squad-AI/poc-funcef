unit FParamRelTotalContrib;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook,
  CMDBLookupCombo, Mask, wwdbedit, Wwdbspin;

type
  TfrmParamRelTotalContrib = class(TfrmOkCancelar)
    Label2: TLabel;
    qrymes: TwwQuery;
    GroupBox1: TGroupBox;
    dbsAno: TwwDBSpinEdit;
    cbmes: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    Procedure Fazqry;
  public
    { Public declarations }
  end;

var
  frmParamRelTotalContrib: TfrmParamRelTotalContrib;

implementation

{$R *.DFM}

uses dRelAssistencial, USistema, UMensErro, FAguarde;

procedure TfrmParamRelTotalContrib.FormCreate(Sender: TObject);
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
end;

procedure TfrmParamRelTotalContrib.Fazqry;
var vMes, vSQL : string;
    vIsSERPROS : boolean;
begin
  (* Exibe o frmAguarde mostrando a mensagem abaixo para o usuário *)
  frmAguarde.Mostra('Aguarde.  Montando relatório...');
  (* Verifica a empresa que o sistema está rodando é SERPROS *)
  if    (Pos('SERPRO',sistema.NomeEmpresa) > 0) then vIsSERPROS := true
  else vIsSERPROS := false;
  vSQL :=        ' SELECT'                                          +
                 '   PJ.NOME AS PATROCINADORA,'                     +
                 '   PJ.IDPESSOA AS IDPESSJUR,'                     +
                 '   PA.NOME AS PLANO,'                             +
                 '   PA.IDPLANASS,'                                 +
                 '   DECODE(PA.NOME,'+chr(39)+'Plano Dental Basico'          +chr(39)+','+chr(39)+'Plano Dental  '+chr(39)+','+
                                      chr(39)+'Plano Dental Basico + Protese'+chr(39)+','+chr(39)+'Plano Dental  '+chr(39)+','+
                                      chr(39)+'Plano Funeral'                +chr(39)+','+chr(39)+'Plano Funeral '+chr(39)+','+
                                      chr(39)+'Plano Saude Quarto Coletivo'  +chr(39)+','+chr(39)+'Plano Saúde   '+chr(39)+','+
                                      chr(39)+'Plano Saude Quarto Privativo' +chr(39)+','+chr(39)+'Plano Saúde   '+chr(39)+','+
                                      chr(39)+'Seguro de Vida'               +chr(39)+','+chr(39)+'Seguro de Vida'+chr(39)+') AS PRODUTO,'+


                 '   PPP.INSCRICAONUMERO AS INSCRICAO,'             +
                 '   P.NOME AS DEPENDENTE,'                         +
                 '   PT.NOME AS TITULAR,'                           +
                 '   H.VALORESPERADO AS VALOR,'                     +
                 '   H.MES AS MESREFERENCIA,'                       +
                 '   H.MESCOBRANCA,'                                +
                 '   DECODE(DT.IDDEPENDENCIA,''PRP'',0,1) AS TIT,'  +
                 '   S.FLGINTERNO,';
  if vIsSERPROS then
    vSQL := vSQL + '   QRYPATRO.VLRPATRO,'
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
                 '   PESSOA P,'         +
                 '   PESSOA PJ,'        +
                 '   PESSOA PT,'        +
                 '   PLANASS PA,'       +
                 '   CONTRIBASS CA,'    +
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
                 '   AND (PPP.IDSITPART   =   S.IDSITPART)'             +
                 (* Cobrança do mês de refêrencia escolhido pelo usuário *)
                 '   AND (H.MES           = ' + chr(39) + vMes + chr(39) + ')';
    (* Ordenação *)
  vSQL := vSQL+  ' ORDER BY PJ.NOME,PAG,PRODUTO,PT.NOME,P.NOME';
  dtmRelAssistencial.qryRelTotalContrib.Close;
  dtmRelAssistencial.qryRelTotalContrib.SQL.Clear;
  dtmRelAssistencial.qryRelTotalContrib.SQL.Add(vSQL);
  dtmRelAssistencial.qryRelTotalContrib.Open;
  if dtmRelAssistencial.qryRelTotalContrib.IsEmpty then frmAguarde.Apaga;
end;

procedure TfrmParamRelTotalContrib.bbtnConfirmarClick(Sender: TObject);
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

procedure TfrmParamRelTotalContrib.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qrymes.Close;
end;

procedure TfrmParamRelTotalContrib.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  cbMes.ItemIndex := -1;
  cbMes.SetFocus;
end;

end.
