unit FTransfFundos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, Db, Wwdatsrc,
  DBTables, Wwquery, Grids, Wwdbigrd, Wwdbgrid,
  DBCtrls2, Mask, wwdbedit, wwdblook, TEdNum,uLancContab, TREdit,
  TB97Tlbr, IvDictio, IvMulti, IvEMulti, wwdbdatetimepicker,
  CMDateTimePicker;

type
  TfrmTransfFundos = class(TfrmOkCancelar)
    qryContaDe: TwwQuery;
    dsContaDe: TwwDataSource;
    Panel2: TPanel;
    pnlContaDe: TPanel;
    Label1: TLabel;
    dbgContaDe: TwwDBGrid;
    pnlContaPara: TPanel;
    Label2: TLabel;
    dsContaPara: TwwDataSource;
    qryContaPara: TwwQuery;
    edContaDe: TEdit;
    edContaPara: TEdit;
    lblContaDe: TLabel;
    lblContaPara: TLabel;
    qryHistorico: TwwQuery;
    lblHistPad: TLabel;
    dblcHistPad: TwwDBLookupCombo;
    lblHistorico: TLabel;
    lblValor: TLabel;
    lblDocumento: TLabel;
    lblData: TLabel;
    dbgContaPara: TwwDBGrid;
    edDataLanc: TCMDateTimePicker;
    edHistorico: TEdit;
    edNumDoc: TEdit;
    qryCotacaoMoeda: TwwQuery;
    qryContabil: TwwQuery;
    qryContabil1: TwwQuery;
    ednValorCorrente: TRealEdit;
    dsContabil: TwwDataSource;
    dsContabil1: TwwDataSource;
    updContabil: TUpdateSQL;
    updContabil1: TUpdateSQL;
    qryUnidNegoc: TwwQuery;
    qryParamGlobal: TwwQuery;
    dblcUnidNegocOri: TwwDBLookupCombo;
    lblUnidNegoc: TLabel;
    Label3: TLabel;
    dblcUnidNegocDest: TwwDBLookupCombo;
    qryPlanoPrev: TwwQuery;
    qryPlanoPrevNOME: TStringField;
    qryPlanoPrevIDPLANOPREV: TFloatField;
    qryPatro: TwwQuery;
    qryPatroRAZAOSOCIAL: TStringField;
    qryPatroIDPESSOA: TFloatField;
    Label4: TLabel;
    dblcPatrocinador: TwwDBLookupCombo;
    Label5: TLabel;
    dblcPlanoPrev: TwwDBLookupCombo;
    dblcTipoRecDes: TwwDBLookupCombo;
    Label6: TLabel;
    qryTiporecDes: TwwQuery;
    cbImprimecheque: TCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure dbgContaDeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure dbgContaParaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure qryContaDeAfterScroll(DataSet: TDataSet);
  private
   { Private declarations }
   bImpCheque : Boolean;
  public
    { Public declarations }
  end;

var
  frmTransfFundos: TfrmTransfFundos;

implementation

uses uMensErro,uDataBase, DBaseDados,UModulo,uSistema,uFuncaoGeral,UIntegraBack,
     FEmiteCheque,uLancFinanc;

{$R *.DFM}

procedure TfrmTransfFundos.FormCreate(Sender: TObject);
var
   qryAux : TwwQuery;
begin
  inherited;

  qryAux:=TwwQuery.Create(Self);
  try
     qryAux.DatabaseName:='BaseDados';
     qryAux.SQL.Text:='SELECT FlgImpCheque FROM ParamFinanc '+
                      'WHERE (IDPESSOA='+IntToStr(Sistema.IdEmpresa)+')';
     qryAux.Open;
     bImpCheque:=(qryAux.FieldByName('FlgImpCheque').AsString='S');
     cbImprimecheque.Checked:=bImpCheque;
     qryAux.Close;
  finally
     qryAux.Free;
  end;
end;

procedure TfrmTransfFundos.FormActivate(Sender: TObject);
begin
  inherited;
  edDataLanc.Text := DateToStr(Date);
  //
  qryContaDe.Close;
  qryContaDe.SQL.Clear;
//  qryContaDe.SQL.text := 'SELECT * FROM '+Sistema.PrefixoServidor+'PORTADORCONTA WHERE IDPESSOA = '+InttoStr(Sistema.idEmpresa)+' ORDER BY DESCRICAO';
  qryContaDe.SQL.text := 'SELECT PC.*,BC.NUMBANCO '+
                         'FROM PORTADORCONTA PC, BANCO BC '+
                         'WHERE (PC.IDBANCO=BC.IDPESSOA(+)) AND '+
                         '      (PC.IDPESSOA='+InttoStr(Sistema.idEmpresa)+') '+
                         'ORDER BY DESCRICAO';
  qryContaDe.Open;

  cbImprimecheque.Enabled:=(Trim(qryContaDe.FieldByName('NUMBANCO').AsString)<>'');
  cbImprimecheque.Checked:=(Trim(qryContaDe.FieldByName('NUMBANCO').AsString)<>'') AND (bImpCheque);

  //
  qryContaPara.Close;
  qryContaPara.SQL.Clear;
  qryContaPara.SQL.text := 'SELECT * FROM PORTADORCONTA WHERE IDPESSOA = '+InttoStr(Sistema.idEmpresa)+' ORDER BY DESCRICAO';
  qryContaPara.Open;
  //
  qryHistorico.Close;
  qryHistorico.SQL.Clear;
  qryHistorico.SQL.text := 'SELECT * FROM HISTORICOFINAN ORDER BY DESCRICAO';
  qryHistorico.Open;
  //
  qryParamGlobal.Close;
  qryParamGlobal.SQL.Clear;
  qryParamGlobal.SQL.text := 'SELECT USACRESPON,USAABC,UNIDNEGOC FROM PARAMGLOBAL WHERE IDPESSOA = '+InttoStr(Sistema.idempresa);
  qryParamGlobal.Open;
  //
  if Sistema.UsaPlanoPatro then
   begin
      dblcPlanoPrev.Enabled:=Sistema.UsaPlanoPatro;
      dblcPatrocinador.Enabled:=Sistema.UsaPlanoPatro;      
      qryPatro.Close;
      qryPatro.Open;
      qryPlanoPrev.Close;
      qryPlanoPrev.Open;
   end;
  //
  if (qryParamGlobal.FieldByName('USAABC').AsString = 'N') then
  Begin
     qryUnidNegoc.Close;
     qryUnidNegoc.SQL.Clear;
     qryUnidNegoc.SQL.text := 'SELECT UNIDNEGOC,NOME FROM UNIDNEGOCIO WHERE IDPESSOA = '+InttoStr(Sistema.idempresa)+' AND UNIDNEGOC = '+qryParamGlobal.FieldByName('UNIDNEGOC').AsString;
     qryUnidNegoc.Open;
     dblcUnidNegocOri.Enabled     :=False;
     dblcUnidNegocOri.LookupValue :=qryUnidNegoc.FieldByName('UNIDNEGOC').AsString;
     dblcUnidNegocDest.Enabled    :=False;
     dblcUnidNegocDest.LookupValue:=qryUnidNegoc.FieldByName('UNIDNEGOC').AsString;
  end
  else
  Begin
     qryUnidNegoc.Close;
     qryUnidNegoc.SQL.Clear;
     qryUnidNegoc.SQL.text := 'SELECT UNIDNEGOC,NOME FROM UNIDNEGOCIO WHERE IDPESSOA = '+InttoStr(Sistema.idempresa)+' AND UNETIPO = ''A'' ORDER BY NOME';
     qryUnidNegoc.Open;
     dblcUnidNegocOri.Enabled :=True;
     dblcUnidNegocDest.Enabled:=True;
  end;
  //
  if qryContaDe.RecordCount < 2 then
  Begin
     MsgDlg('Para fazer Transferência entre Contas deve-se ter pelo menos duas contas cadastradas','Erro',mtError,[mbOk],0);
     bbtnSairClick(Self);
     exit;
  end;
  qryContaDe.First;
  qryContaPara.First;
  if (qryContaDe.FieldByName('DESCRICAO').AsString = qryContaPara.FieldByName('DESCRICAO').AsString) then
  Begin
     qryContaPara.Next;
     if qryContaPara.Eof then
        qryContaPara.First;
  end;
  edContaDe.Text := qryContaDe.FieldByName('DESCRICAO').AsString;
  edContaPara.Text := qryContaPara.FieldByName('DESCRICAO').AsString;
  edHistorico.Text := 'Transferência '+trim(edContaDe.text)+' para '+trim(edContaPara.text);
  if Length(edHistorico.Text)>60 then edHistorico.Text:=Copy(edHistorico.Text,1,60);

  qryTiporecDes.Close;
  qryTiporecDes.ParamByName('IDPessoa').AsFloat:=Sistema.IdEmpresa;
  qryTiporecDes.Open;
end;

procedure TfrmTransfFundos.dbgContaDeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if (qryContaDe.FieldByName('DESCRICAO').AsString = qryContaPara.FieldByName('DESCRICAO').AsString) then
  Begin
     qryContaPara.Next;
     if qryContaPara.Eof then
        qryContaPara.First;
  end;
  edContaDe.Text := qryContaDe.FieldByName('DESCRICAO').AsString;
  edContaPara.Text := qryContaPara.FieldByName('DESCRICAO').AsString;
  edHistorico.Text := 'Transferência '+trim(edContaDe.text)+' para '+trim(edContaPara.text);
  if Length(edHistorico.Text)>60 then edHistorico.Text:=Copy(edHistorico.Text,1,60);
end;

procedure TfrmTransfFundos.bbtnConfirmarClick(Sender: TObject);
var
   iPlnCodigo,iCodDe,iCodPara:Integer;rValorOutraMoeDe,rValorOutraMoePara:Real;
   liPeriodo,liExercicio,liRetFuncao,liEmpresa : Integer;
   sMens,sHist1,sHist2,sHist3,sHist4,sHist5:String;
   bRespostaChk : Boolean;
   rIDPatroAux, rIDPlanoAux : Real;
begin
  inherited;
  if trim(edDataLanc.Text)='' then
     begin
       MsgDlg('Obrigatório preencher a Data de Lançamento','Erro',mtError,[mbOk],0);
       edDataLanc.SetFocus;
       exit;
     end;
  if trim(dblcUnidNegocOri.Text)='' then
     begin
       MsgDlg('Obrigatório preencher a Atividade da Conta Origem','Erro',mtError,[mbOk],0);
       dblcUnidNegocOri.SetFocus;
       exit;
     end;
  if trim(dblcUnidNegocDest.Text)='' then
     begin
       MsgDlg('Obrigatório preencher a Atividade da Conta Destino','Erro',mtError,[mbOk],0);
       dblcUnidNegocDest.SetFocus;
       exit;
     end;
  liEmpresa:=Sistema.idEmpresa;
  if (IntegraBack.Contabilidade = 'S') then
  Begin
      //Testa se o período contábil está aberto ou fechado.
     liRetFuncao:=TestaPeriodo(True,'BASEDADOS',edDataLanc.Text,IntToStr(Sistema.IdModulo),liExercicio,
                               liPeriodo,liEmpresa,sMens);
     if liRetFuncao <> 0 then
        begin
          edDataLanc.SetFocus;
          exit;
        end;
  end;

  if ednValorCorrente.Value = 0 then
   begin
      MsgDlg('Obrigatório preencher o Valor em Moeda Corrente','Erro',mtError,[mbOk],0);
      ednValorCorrente.SetFocus;
      exit;
   end;
  if trim(dblcHistPad.Text)='' then
   begin
      MsgDlg('Obrigatório preencher o Histórico Padrão','Erro',mtError,[mbOk],0);
      dblcHistPad.SetFocus;
      exit;
    end;
  if trim(edHistorico.Text)='' then
   begin
      MsgDlg('Obrigatório preencher o Histórico do Lançamento','Erro',mtError,[mbOk],0);
      edHistorico.SetFocus;
      exit;
   end;
  if trim(edNumDoc.Text)='' then
   begin
      MsgDlg('Obrigatório preencher o Número do Documento','Erro',mtError,[mbOk],0);
      edNumDoc.SetFocus;
      exit;
   end;

  if IntegraBack.Contabilidade = 'S' then
   begin
      if (trim(qryContaDe.FieldByName('PLACONTA').AsString) = '') or (trim(qryContaPara.FieldByName('PLACONTA').AsString) = '') then
       begin
          MsgDlg('Como a contabilidade está integrada é obrigatório preencher a conta contábil das contas bancárias/caixas','Erro',mtError,[mbOk],0);
          ednValorCorrente.SetFocus;
          exit;
       end;
   end;

  if cbImprimecheque.Checked then
   begin
      //Exibe formulário de Emissão de Cheque
      with TfrmEmiteCheque.Create(Self) do
       try
          Valor:=ednValorCorrente.Value;
          CodigoPortador:=qryContaDe.FieldByName('CODPORTADOR').AsInteger;
          AutoDestroi:=False;
          CodigoBanco:=qryContaDe.FieldByName('NUMBANCO').AsString;
          ShowModal;
          bRespostaChk:=(ModalResult=mrCancel);
       finally
          Free;
       end;

      if bRespostaChk then
         if MsgDlg('Deseja também Cancelar a Transferência',
                   'Atenção', mtConfirmation, [mbYes,mbNo],0) = mrYes then Exit;
   end;

  try
     StartTransacao;
     //Contabilização para ContaDe
     qryContabil.Close;
     qryContabil.SQL.text := 'SELECT * FROM LANCAMENTO WHERE PLNCODIGO = 0 ';
     qryContabil.Open;
     //
     //Contabilização para ContaPara
     qryContabil1.Close;
     qryContabil1.SQL.text := 'SELECT * FROM LANCAMENTO WHERE PLNCODIGO = 0 ';
     qryContabil1.Open;
     if IntegraBack.Contabilidade = 'S' then
      begin
         sHist1:='';
         sHist2:='';
         sHist3:='';
         sHist4:='';
         sHist5:='';
         FuncaoGeral.ArrumaHistorico(edHistorico.Text,sHist1,sHist2,sHist3,sHist4,sHist5);
         //Dados do Banco Origem
         qryContabil.Insert;
         qryContabil.FieldByName('PLACONTA').AsString:=qryContaDe.FieldByName('PLACONTA').AsString;
         qryContabil.FieldByName('PLANO').AsInteger:=qryContade.FieldByName('PLANO').AsInteger;
         qryContabil.FieldByName('CODSUBCONTA').AsInteger:=qryContaDe.FieldByName('CODSUBCONTA').AsInteger;

         if trim(qryContade.FieldByName('CODCENTROCUSTO').AsString) <> '' then
            qryContabil.FieldByName('CODCENTROCUSTO').AsString:=qryContaDe.FieldByName('CODCENTROCUSTO').AsString;

         qryContabil.FieldByName('LACVALOR').AsFloat  :=ednValorCorrente.Value;
         qryContabil.FieldByName('UNIDNEGOC').AsString:=dblcUnidNegocOri.LookupValue;
         qryContabil.FieldByName('LACHIST1').AsString :=sHist1;
         qryContabil.FieldByName('LACHIST2').AsString :=sHist2;
         qryContabil.FieldByName('LACHIST3').AsString :=sHist3;
         qryContabil.FieldByName('LACHIST4').AsString :=sHist4;
         qryContabil.FieldByName('LACHIST5').AsString :=sHist5;
         qryContabil.FieldByName('LACNUMDOC').AsString:=edNumDoc.Text;
         qryContabil.FieldByName('LACDEBCRE').AsString:='C';
         qryContabil.FieldByName('LACTIPO').AsString  :='1';

         if Sistema.UsaPlanoPatro then
          begin
             qryContabil.FieldByName('IDPLANOPREV').AsFloat:=StrToFloat(dblcPlanoPrev.LookupValue);
             qryContabil.FieldByName('IDPATRO').AsFloat:=StrToFloat(dblcPatrocinador.LookupValue);
          end;

         qryContabil.Post;

         //Dados do Banco Destino
         qryContabil1.Insert;
         qryContabil1.FieldByName('PLACONTA').AsString:=qryContaPara.FieldByName('PLACONTA').AsString;
         qryContabil1.FieldByName('PLANO').AsInteger:=qryContaPara.FieldByName('PLANO').AsInteger;
         qryContabil1.FieldByName('CODSUBCONTA').AsInteger:=qryContaPara.FieldByName('CODSUBCONTA').AsInteger;

         if trim(qryContaPara.FieldByName('CODCENTROCUSTO').AsString) <> '' then
            qryContabil1.FieldByName('CODCENTROCUSTO').AsString:=qryContaPara.FieldByName('CODCENTROCUSTO').AsString;

         qryContabil1.FieldByName('LACVALOR').AsFloat  :=ednValorCorrente.Value;
         qryContabil1.FieldByName('UNIDNEGOC').AsString:=dblcUnidNegocDest.LookupValue;
         qryContabil1.FieldByName('LACHIST1').AsString :=sHist1;
         qryContabil1.FieldByName('LACHIST2').AsString :=sHist2;
         qryContabil1.FieldByName('LACHIST3').AsString :=sHist3;
         qryContabil1.FieldByName('LACHIST4').AsString :=sHist4;
         qryContabil1.FieldByName('LACHIST5').AsString :=sHist5;
         qryContabil1.FieldByName('LACNUMDOC').AsString:=edNumDoc.Text;
         qryContabil1.FieldByName('LACDEBCRE').AsString:='D';
         qryContabil1.FieldByName('LACTIPO').AsString  :='0';

         if Sistema.UsaPlanoPatro then
          begin
             qryContabil1.FieldByName('IDPLANOPREV').AsFloat:=StrToFloat(dblcPlanoPrev.LookupValue);
             qryContabil1.FieldByName('IDPATRO').AsFloat:=StrToFloat(dblcPatrocinador.LookupValue);
          end;

         qryContabil1.Post;
      end;


     iPlnCodigo:=0;
     iCodDe:=0;
     iCodPara:=0;
     rValorOutraMoeDe:=0;
     rValorOutraMoePara:=0;

     //-------------------------------------------------------------------------

     LancFinanc.LancaFinanceiro(qryContabil1,
                                Sistema.IdModulo,
                                qryHistorico.FieldByName('HISTPADFINAN').Value,
                                qryContaPara.FieldByName('MOECODIGO').AsInteger,
                                Sistema.IdUsuario,
                                qryContaPara.FieldByName('CODPORTADOR').Value,
                                Sistema.idEmpresa,
                                ednValorCorrente.Value,
                                rValorOutraMoePara,
                                edNumDoc.Text,
                                edDataLanc.Text,
                                '',
                                'E',
                                edHistorico.Text,
                                'N',
                                iCodPara,
                                iPlnCodigo,
                                0);

     if iCodPara = -1 then abort;

     rIDPatroAux:=-1;
     rIDPlanoAux:=-1;
     if Sistema.UsaPlanoPatro then
      begin
         rIDPatroAux:=StrToFloat(dblcPatrocinador.LookupValue);
         rIDPlanoAux:=StrToFloat(dblcPlanoPrev.LookupValue);
      end;

     if Trim(dblcTipoRecDes.Text)<>'' then
        LancFinanc.LancaRateioFinanc(StrToInt(dblcUnidNegocDest.LookupValue),
                                     qryContaPara.FieldByName('MOECODIGO').AsInteger,
                                     Sistema.IdEmpresa,
                                     qryContaPara.FieldByName('CODPORTADOR').AsInteger,
                                     ednValorCorrente.Value,
                                     0,
                                     dblcTipoRecDes.LookupValue,
                                     'R',
                                     '9999999999',
                                     edDataLanc.Text,
                                     iCodPara,
                                     qryContaPara.FieldByName('CODCENTROCUSTO').AsString,
                                     -1,
                                     rIDPatroAux,
                                     rIDPlanoAux,
                                     -1);

     //-------------------------------------------------------------------------

     LancFinanc.LancaFinanceiro(qryContabil,
                                Sistema.IdModulo,
                                qryHistorico.FieldByName('HISTPADFINAN').Value,
                                qryContaDe.FieldByName('MOECODIGO').AsInteger,
                                Sistema.IdUsuario,
                                qryContaDe.FieldByName('CODPORTADOR').Value,
                                Sistema.idEmpresa,
                                ednValorCorrente.Value,
                                rValorOutraMoeDe,
                                edNumDoc.Text,
                                edDataLanc.Text,
                                '',
                                'S',
                                edHistorico.Text,
                                'N',
                                iCodDe,
                                iPlnCodigo,
                                0);

     if iCodDe = -1 then abort;

     if Trim(dblcTipoRecDes.Text)<>'' then
        LancFinanc.LancaRateioFinanc(StrToInt(dblcUnidNegocOri.LookupValue),
                                     qryContaDe.FieldByName('MOECODIGO').AsInteger,
                                     Sistema.IdEmpresa,
                                     qryContaDe.FieldByName('CODPORTADOR').AsInteger,
                                     -ednValorCorrente.Value,
                                     0,
                                     dblcTipoRecDes.LookupValue,
                                     'R',
                                     '9999999999',
                                     edDataLanc.Text,
                                     iCodDe,
                                     qryContaDe.FieldByName('CODCENTROCUSTO').AsString,
                                     -1,
                                     rIDPatroAux,
                                     rIDPlanoAux,
                                     -1);

     //-------------------------------------------------------------------------

     LancFinanc.GravaTransFundos(iCodDe,iCodPara);

     CommitTransacao;
     //
     MsgDlg('Transferência Efetuada com Sucesso','Aviso',mtWarning,[mbOk],0);
     FuncaoGeral.TiraIcone;
     edDataLanc.Text := DateToStr(Date);
     ednValorCorrente.Value := 0;
     edNumDoc.Text := '';
  except
     RollBackTransacao;
     MsgDlg('Transferência Não Efetuada','Erro',mtError,[mbOk],0);
     FuncaoGeral.TiraIcone;
     Raise;
  end;
  qryContabil.CancelUpdates;
  edDataLanc.SetFocus;

end;

procedure TfrmTransfFundos.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   edDataLanc.Text := DateToStr(Date);
   ednValorCorrente.Value := 0;
   edNumDoc.Text := '';
   edDataLanc.SetFocus;
end;

procedure TfrmTransfFundos.dbgContaParaMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   inherited;
   if (qryContaDe.FieldByName('DESCRICAO').AsString = qryContaPara.FieldByName('DESCRICAO').AsString) then
   begin
      qryContaDe.Next;
      if qryContaDe.Eof then
         qryContaDe.First;
   end;
   edContaDe.Text := qryContaDe.FieldByName('DESCRICAO').AsString;
   edContaPara.Text := qryContaPara.FieldByName('DESCRICAO').AsString;
   edHistorico.Text := 'Transferência '+trim(edContaDe.text)+' para '+trim(edContaPara.text);
   if Length(edHistorico.Text)>60 then edHistorico.Text:=Copy(edHistorico.Text,1,60);
end;

procedure TfrmTransfFundos.qryContaDeAfterScroll(DataSet: TDataSet);
begin
   inherited;
   cbImprimecheque.Enabled:=(Trim(qryContaDe.FieldByName('NUMBANCO').AsString)<>'');
   cbImprimecheque.Checked:=(Trim(qryContaDe.FieldByName('NUMBANCO').AsString)<>'') AND (bImpCheque);
end;

end.
