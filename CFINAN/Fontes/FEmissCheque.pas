(*******************************************************************************
 08/01/99
  Correção do salto de página para impressões com mais de 4 cheques;
 20/01/99
  Inicialização de Parametro para indicação de impressora default para Cheque/Bloqueto
  Verificação do 'Salto de Páginas' para 4 cheques ou mais.
  Implementação da Data de Emissão, trazendo como Default a data do dia.
 25/01/1999
  Implementação do parâmetro de lançamento no financeiro ( Módulo )
 29/07/1999 - 02.11.02
  Alteração na ordenação do combo forma de pagamento
 06/08/1999 - 02.12.02
  Correção na seleção dos lotes a serem pagos garantindo a listagem apenas de
  lotes relacionados com cheques;
 30/09/1999 - 02.13.13
  Alteração na atualização dos cheques - Ordenação pelo número do lote para a impressão
  e para a atualização, correção na atualização pois não considerava cheques cancelados,
  pulando a numeração dos impressos;
  Inclusão do controle do talão de cheques e da numeração automática de cheques de acordo
  com o parâmetro do sistema;
  Inclusão da impressão de verso do cheque para impressora Check Pronto;
 15/10/1999 - 02.14.02
  Alteração na seleção dos cheques a serem impressos
  Alteração na montagem do verso do cheque e no espaçamento da margem esquerda
  na impressão
 09/12/1999 - 2.14.15
  Correção da mensagem 'A Impressão foi cancelada' ao término da impressão de
  cheques
 21/12/1999 - 2.15.17
  Implementação do processo do RAD de controle de pagamentos
 30/12/1999 - 2.14.18
  Inclusão da verificação do contas caixas formas de pagamento com relação ao
  cheque diferido e dos lançamento no financeiro com a data do mesmo;
 28/01/2000 - 2.16.05
   Implementação da tradução do extenso de acordo com o idioma do sistema
 31/01/2000 - 2.16.06
   Correção na tradução do mês do cheque
 03/02/2000 - 2.17.02
   Correção no extenso do cheque para valores do tipo 800 e 900;
   Correção na descrição da moeda impressa no extenso do cheque;
 15/02/2000 - 02.17.07
   Correção do lançamento no financeiro para cheques com documentos do tipo lança e baixa
 22/02/2000 - 02.17.09
   Correção na data do lançamento no financeiro : Não considerava o float do PortadorForma;
 29/02/2000 - 02.17.11
   Correção na impressão de cheques
*******************************************************************************)

unit FEmissCheque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, wwdblook, Db, DBTables, Wwquery, MAHlpBtn, uIntegraBack,
  Buttons, TB97Tlbr, TB97, ExtCtrls, uMensErro, TREdit,
  IvDictio, IvMulti, IvEMulti, ComPort, uImprimeCheque, uDocumento, uCtrlCheque,
  ComCtrls, Machklb, uRad, uExtensoCM, uGImp, Fselversoch,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TFrmEmissCheque = class(TfrmOkCancelar)
    qryLotePagto: TwwQuery;
    dsLotePagto: TDataSource;
    qryUpdate: TwwQuery;
    qryFormaRecPag: TwwQuery;
    qryAux: TwwQuery;
    Qry: TwwQuery;
    qryCheque: TwwQuery;
    qryFormaRecPagCODPORTFORMA: TFloatField;
    qryFormaRecPagIDTEMPLCHEQUE: TFloatField;
    qryFormaRecPagDESCRICAO: TStringField;
    qryFormaRecPagQTDEDIGITOSANO: TStringField;
    qryFormaRecPagLANCAFINANC: TStringField;
    qryFormaRecPagCODPORTADOR: TFloatField;
    QryDocsLote: TwwQuery;
    QryDocsLoteVALOR: TFloatField;
    QryDocsLoteNODOCUMENTO: TFloatField;
    QryDocsLoteCOMPLDOCUMENTO: TStringField;
    QryDocsLoteDATAPROGRAMADA: TDateTimeField;
    QryDocsLoteFORNECEDOR: TStringField;
    QryDocsLoteHISTORICOCOMPL: TStringField;
    qryFormaRecPagCODSUBCONTA: TFloatField;
    qryFormaRecPagCODCENTROCUSTO: TStringField;
    qryFormaRecPagPLACONTA: TStringField;
    Panel3: TPanel;
    Panel1: TPanel;
    FormaPag: TLabel;
    Label1: TLabel;
    dblkFormaPag: TwwDBLookupCombo;
    ClCheques: TCMchklistbox;
    Panel2: TPanel;
    SbAdTodos: TSpeedButton;
    SbAdInverte: TSpeedButton;
    Panel4: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Bevel1: TBevel;
    DtEmis: TCMDateTimePicker;
    edtNumChq: TRealEdit;
    CkData: TCheckBox;
    EdtLocalEmissCheque: TEdit;
    CkbMaquina: TCheckBox;
    GpMaqCheque: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    CmbModelo: TComboBox;
    ComboBoxDeviceName: TComboBox;
    qryFormaRecPagFLGIMPCONDENSADO: TStringField;
    qryFormaRecPagNUMCHQSALTO: TFloatField;
    qryFormaRecPagNUMLINHASSALTO: TFloatField;
    Extenso: TExtensoCM;
    qryFormaRecPagPLACONTACONTABCHQ: TStringField;
    qryFormaRecPagPLANOCONTABCHQ: TFloatField;
    qryFormaRecPagFLGCONTABEMISCHQ: TStringField;
    CmCheque: TCmImprimeCheque;
    qryFormaRecPagDMAIS: TFloatField;
    GImp1: TGImp;
    CkbVersoCheque: TCheckBox;
    qryparamchq: TwwQuery;
    qryFormaRecPagFLGCONTROLACHEQUE: TStringField;
    qryUltCheque: TwwQuery;
    QryBuscaRateio: TwwQuery;
    procedure FormActivate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure CkDataClick(Sender: TObject);
    procedure CkbMaquinaClick(Sender: TObject);
    procedure CmbModeloChange(Sender: TObject);
    procedure ComboBoxDeviceNameChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SbAdTodosClick(Sender: TObject);
    procedure SbAdInverteClick(Sender: TObject);
    procedure dblkFormaPagChange(Sender: TObject);
  private
    { Private declarations }
    sSql, sNumLoteChecked : String;
    bRepeteImpressao, bdestinase, bdocto, bdtprog, bvalor, bforn,
    bhist, blocal         : Boolean;
    CtrlChequeEmis        : TCtrlCheque;
    sCodPortadorForma     : String;
    procedure GravaEmissao;
    procedure ImprimeChequeConfig;
    Function  ImprimeChequeMac:Boolean;
    Function  ImprimeVersoChequeConfig:Boolean;
    procedure MontaCheque;
    procedure ContabilizaEmissao(iNumLote,iNumChq: Integer);
  public
    { Public declarations }
  end;
var
  FrmEmissCheque: TFrmEmissCheque;

implementation

Uses uSistema, dBaseDados, uModulo, UCheqBloq, uDataBase, uLancFinanc,
     uLancContab, uFuncaoGeral, fMensVersoCheque, uString;

{$R *.DFM}

procedure TFrmEmissCheque.FormActivate(Sender: TObject);
Var
  Ssql: String;
begin
  inherited;

  Qry.Close;
  Qry.Sql.Text := 'SELECT IDTEMPLCHEQUE,LAYOUT, QTDEDIGITOSANO FROM TEMPLCHEQUE';
  Qry.Open;

  If qryFormaRecPag.Active       Then qryFormaRecPag.Close;
  If Not qryFormaRecPag.Prepared Then qryFormaRecPag.Prepare;
  qryFormaRecPag.ParamByName('IDPESSOA').AsInteger := Sistema.idEmpresa;
  qryFormaRecPag.ParamByName('RECPAG').AsString    := IntegraBack.RecPag;
  qryFormaRecPag.Open;


  {Pega o PORTADOR FORMA informado na tela de Parâmetros do Sistema
   Fábio Barros - 05/04/2002}
  dblkFormaPag.LookupValue := sCodPortadorForma;
  dblkFormaPagChange(self);

  qryLotePagto.Close;
  sSQL :=  ' WHERE ((FLAGEMISSAO IS NULL) OR (FLAGEMISSAO = ''0'')) AND ' +
           ' ((FLAGCANCEL IS NULL) OR (FLAGCANCEL = ''0'')) AND ' +
           ' (LOTEPAGTO.CODPORTFORMA = PORTADORFORMA.CODPORTFORMA) AND ' +
           ' (LOTEPAGTO.IDPESSOA = ' + InttoStr(sistema.IdEmpresa) + ') AND ' +
           ' (LOTEPAGTO.NUMLOTE  = LOTEX.NUMLOTE) AND ' +
           ' (LOTEX.CODDOCUMENTO = DOC.CODDOCUMENTO) AND ' +
           ' (DOC.RECPAG         = '''+ IntegraBack.RecPag +''') AND ' +
           ' (PAR.IDPESSOA = LOTEPAGTO.IDPESSOA) AND ' +
           ' (PESS.IDPESSOA = LOTEPAGTO.IDPESSOA) AND ' +
           ' (PORTADORFORMA.IDTEMPLCHEQUE = CHEQUE.IDTEMPLCHEQUE) AND ';

  If Trim(dblkFormaPag.text) <> '' then
     sSQL := sSQL +' (LOTEPAGTO.CODPORTFORMA  = '+ dblkFormaPag.LookupValue  +  ')  AND '
  Else
     sSQL := sSQL +' (LOTEPAGTO.CODPORTFORMA  = -1) AND ';

  if sSQL <> ''  then
    sSQL := Copy(sSQL, 1, Length(sSQL)-5);

  qryLotePagto.Sql.clear;
  qryLotePagto.SQL.Text := ' SELECT distinct LOTEPAGTO.NUMLOTE,LOTEPAGTO.CODPORTFORMA,DESCRICAO,   '+
                           ' LOTEPAGTO.FAVORECIDO,Par.LOCALEMISCHEQUE,PESS.NOME              '+
                           ' FROM LotePagto, LOTEXDOCUM LOTEX, DOCUMENTO DOC, PESSOA PESS, PARAMCAP PAR,' +
                           ' TEMPLCHEQUE CHEQUE, PortadorForma ' +
                           sSql + ' ORDER BY NUMLOTE'+'';
  qryLotePagto.Open;
end;

function TFrmEmissCheque.ImprimeVersoChequeConfig:boolean;
var
  sData: string;
  x, i: Integer;
begin
  Result := False;
  try
    if CkbVersoCheque.Checked then
    begin
      if Application.MessageBox('Vire o formulário para impressão de verso de '+
                                'cheque e posicione no primeiro cheque impresso',
                                'Aguardando Comando...',
                                Mb_IconInformation + Mb_OkCancel) = Id_Cancel Then
        Abort
      else
      begin
        qrycheque.first;
        if GImp1.Inicializar then
        begin
          GImp1.Condensado:= (qryFormaRecPagFLGIMPCONDENSADO.AsString = 'S');
          while not qrycheque.eof do
          begin
            if CkData.Checked then
              sData := qrycheque.FieldByName('DataEmissao').AsString
            else
              sData := DtEmis.Text;
            if QryDocsLote.Active then
              QryDocsLote.Close;
            if not QryDocsLote.Prepared then
              QryDocsLote.Prepare;
            QryDocsLote.ParamByName('NUMLOTE').AsFloat :=
              qrycheque.FieldByName('NUMLOTE').AsFloat;
            QryDocsLote.Open;
            if not QryDocsLote.IsEmpty then
            begin
              try
                GImp1.ImprimirTexto(' ');
                GImp1.ImprimirTexto(' ');
                GImp1.ImprimirTexto('Destina-se este cheque para:');
                GImp1.ImprimirTexto(' ');
                QryDocsLote.First;
                while not QryDocsLote.Eof do
                begin
                  GImp1.ImprimirTexto(
                    'Nº ' + FormatFloat('###,###,###,###,###,###,###',
                    QryDocsLoteNODOCUMENTO.AsFloat) +
                    ' ' + Trim(QryDocsLoteCOMPLDOCUMENTO.AsString) +
                    ' de ' + QryDocsLoteDATAPROGRAMADA.AsString + ' valor: ' +
                    FormatFloat('#,##0.00',Abs(QryDocsLoteVALOR.AsFloat)));

                  GImp1.ImprimirTexto(' para: ' + QryDocsLoteFORNECEDOR.AsString +
                                   ' ' + QryDocsLoteHISTORICOCOMPL.AsString);

                  QryDocsLote.Next;
                end; // while
                GImp1.ImprimirTexto('');
                GImp1.ImprimirTexto(EdtLocalEmissCheque.Text + ', ' +
                  FormatDateTime('d "de" mmmm "de" yyyy',StrToDate(sData))+'.');
                GImp1.ImprimirTexto('');
                if GImp1.Condensado then
                  x := 19
                else
                  x := 18;
                x := x - 9;
                for i := 1 to x do
                  GImp1.ImprimirTexto('');

              except
                GImp1.Finalizar;
                //frmMensVersoCheque.Free;
              end;
            end;  //
            qrycheque.next;
          end;
          GImp1.Finalizar;
        end;
      end;//messagebox
    end
    else
      Abort;
  except
    Result := False
  end;
end;

procedure TFrmEmissCheque.bbtnConfirmarClick(Sender: TObject);
Var
 INumCheques, X, iNumChequeTeste: Integer;
begin
 inherited;
 If EdtLocalEmissCheque.Text = '' Then
 Begin
     Msgdlg('Indique o local de emissão do cheque','Aviso',mterror,[mbOk],0);
     EdtLocalEmissCheque.SetFocus;
     Exit;
 end;

 If dblkFormaPag.Text = '' Then
 Begin
     Msgdlg('Indique a forma de pagamento','Aviso',mterror,[mbOk],0);
     dblkFormaPag.SetFocus;
     Exit;
 end;

 if edtNumChq.Value = 0 then
    begin
       Msgdlg('Entre com o Número do Cheque','Aviso',mterror,[mbOk],0);
       edtNumChq.setfocus;
       exit;
    end;

// qryFormaRecPag.Locate('CODPORTFORMA',StrToInt(dblkFormaPag.LookupValue),[]);

 if (DtEmis.text = '') and (Not CkData.Checked) then
    begin
       Msgdlg('Favor Indicar a data de emissão','Aviso',mterror,[mbOk],0);
       edtNumChq.setfocus;
       exit;
    end;

 sNumLoteChecked := '';
 For X:=0 To ClCheques.Items.Count - 1 Do
 Begin
     If ClCheques.Selected[x] And Modulo.ProcessoRadLiberado(StrToInt(ClCheques.Items[x])) Then
        sNumLoteChecked := sNumLoteChecked + ClCheques.Items[x] + ','
     Else
       ClCheques.Selected[x] := False;
 End;

 If sNumLoteChecked = '' Then
 Begin
    Msgdlg('Não existem lotes selecionados para emissão','Aviso',mterror,[mbOk],0);
    exit;
 End
 Else
   sNumLoteChecked := Copy(sNumLoteChecked,1,Length(sNumLoteChecked)-1);

 DtmBaseDados.Qry.Close;
 DtmBaseDados.Qry.SQL.Text :=
          'SELECT COUNT(LOTP.NUMLOTE) AS NUMCHQ ' +
          'FROM LOTEPAGTO LOTP ' +
          'WHERE ' +
          ' (LOTP.IDPESSOA = ' + IntToStr(( sistema.idEmpresa )) + ') AND ' +
          ' (LOTP.NUMLOTE IN (' + sNumLoteChecked + ')) AND' +
          ' (LOTP.CODPORTFORMA = ' + dblkFormaPag.lookupValue + ') AND ' +
          ' ((LOTP.FLAGEMISSAO = ''0'') OR (LOTP.FLAGEMISSAO IS NULL)) AND ' +
          ' ((LOTP.FLAGCANCEL = ''0'') OR (LOTP.FLAGCANCEL IS NULL))';
 DtmBaseDados.Qry.Open;
 INumCheques :=  DtmBaseDados.Qry.FieldByName('NUMCHQ').AsInteger;
 DtmBaseDados.Qry.Close;
 iNumChequeTeste := Round(edtNumChq.Value);


 If (Modulo.ControlaEmisCheque) Or
    ((Not Modulo.ControlaEmisCheque) And (qryFormaRecPagFLGCONTROLACHEQUE.AsString = 'S')) Then
 Begin
    CtrlChequeEmis.ValidaPrimeiroCheque := True;
    For X:=1 to INumCheques Do
    Begin
      CtrlChequeEmis.MostraMsg    := True;
      CtrlChequeEmis.VerificaChq  := True;
      CtrlChequeEmis.CodPortador  := qryFormaRecPagCODPORTADOR.AsInteger;
      CtrlChequeEmis.NumCheque    := iNumChequeTeste;
      CtrlChequeEmis.GravaNumChq  := False;
      If Not CtrlChequeEmis.ValidaNumCheque Then Exit;
      Inc(iNumChequeTeste);
    End;
 End;

 Try
  Screen.Cursor := CrHourGlass;

  MontaCheque;

  If Not qryCheque.IsEmpty Then
  Begin

      If CkbMaquina.Checked Then
      Begin
         If Not ImprimeChequeMac Then
         Begin
            Msgdlg('A impressão foi cancelada','Aviso',mterror,[mbOk],0);
            Abort;
         End;
         GravaEmissao;
      End
      Else
      begin
         ImprimeChequeConfig;
         GravaEmissao;
          if not bRepeteImpressao  then
          begin
            ImprimeVersoChequeConfig;
          end;
      end;
  End
  Else
      Msgdlg('Não existe cheque para ser impresso', 'Aviso', mterror,[mbOk],0);
 Except
    Raise;
 End;
  {Pega o PORTADOR FORMA informado na tela de Parâmetros do Sistema
   Fábio Barros - 05/04/2002}
  dblkFormaPag.LookupValue := sCodPortadorForma;
  dblkFormaPagChange(self);

 Screen.Cursor := CrDefault;

end;

procedure TFrmEmissCheque.MontaCheque;
begin
  qryCheque.Close;
  qryCheque.Sql.Text :=
    ' SELECT '+
       'LotD.NUMLOTE,'+
       'Sum(LotD.VALOR) AS VALOR,'+
       'LotP.FAVORECIDO,'+
       'Par.LOCALEMISCHEQUE,'+
       'LotP.DATAEMISSAO,'+
       'Bc.NUMBANCO,'+
       'LotP.DATADIFERIDO '+
    ' FROM '+
       'LotexDocum LotD, '+
       'LotePagto LotP, '+
       'PORTADORFORMA Pf, '+
       'PORTADORCONTA Pc, '+
       'BANCO Bc, '+
       'PARAMCAP Par '+
    ' WHERE '+
       '(LotP.IDPESSOA = '+inttostr(sistema.idEmpresa)+') AND '+
       '(lotP.codportforma = '+dblkFormaPag.LookUpValue+') AND '+
       '(LotP.NUMLOTE IN ('+sNumLoteChecked+')) AND '+
       '((LotP.FLAGEMISSAO IS NULL) OR (LotP.FLAGEMISSAO = ''0'')) AND '+
       '((LotP.FLAGCANCEL IS NULL) OR (LotP.FLAGCANCEL = ''0'')) AND '+
       '(Par.RECPAG = '''+IntegraBack.RecPag+''') AND '+
       '(Par.IDPESSOA = LotP.IDPESSOA) AND '+
       '(LotD.NUMLOTE = LotP.NUMLOTE) AND '+
       '(LotP.CODPORTFORMA = Pf.CODPORTFORMA) AND '+
       '(PF.CODPORTADOR = Pc.CODPORTADOR) AND '+
       '(Pc.IDBANCO = Bc.IDPESSOA) '+
    ' GROUP BY '+
       'LotD.NUMLOTE, '+
       'LotP.FAVORECIDO, '+
       'Par.LOCALEMISCHEQUE, '+
       'LotP.DataEmissao, '+
       'Bc.NUMBANCO, '+
       'Lotp.DataDiferido '+
    ' ORDER BY LotD.NUMLOTE ';
  qryCheque.Open;
end;

procedure TFrmEmissCheque.ImprimeChequeConfig;
var
   svalor, sData: String;
   CheqBloqCM : TCheqBloqCM;
begin
   CheqBloqCM := TCheqBloqCM.Create(Modulo.ImpressoraDefault,Modulo.ModeloImpressora);

   Try
      CheqBloqCM.NumBloqChqSaltoLinha  := qryFormaRecPagNUMCHQSALTO.AsInteger;
      CheqBloqCM.NumLinhasSalto        := qryFormaRecPagNUMLINHASSALTO.AsInteger;

      If CheqBloqCM.InicializaImpressora('Emissão de Cheques') Then
      Begin
         CheqBloqCM.FonteCondensada := (qryFormaRecPagFLGIMPCONDENSADO.AsString = 'S');
         qrycheque.First;
         While not qrycheque.eof do
         Begin
             If CkData.Checked Then
               sData := qrycheque.FieldByName('DataEmissao').AsString
             Else
               sData := DtEmis.Text;

             svalor := FormatFloat('#,##0.00',qryCheque.FieldByName('VALOR').AsFloat);

             Extenso.Valor                   := qryCheque.FieldByName('VALOR').AsFloat;

             If Sistema.IdiomaAtivo = 2 Then
             Begin
               Extenso.DescricaoMoeda.Singular := '';
               Extenso.DescricaoMoeda.Plural   := '';
             End
             Else
               Extenso.SetaMoedaPadrao;

             Extenso.SetaIdiomaPadrao;
             Extenso.Escreve;

             CheqBloqCM.IdTemplCheque   := qryFormaRecPag.FieldByName('idTemplCheque').AsInteger;
             CheqBloqCM.CompAno         := qryFormaRecPag.FieldByName('QTDEDIGITOSANO').AsInteger;
             CheqBloqCM.Valor           := CheqBloqCM.CompletaValorCheque(svalor,15);
             CheqBloqCM.Extenso         := Extenso.Extenso;
             CheqBloqCM.Portador        := qrycheque.FieldByName('FAVORECIDO').asstring;
             CheqBloqCM.Local           := EdtLocalEmissCheque.Text;
             CheqBloqCM.Data            := StrToDate(sData);
             If Not qrycheque.FieldByName('DATADIFERIDO').IsNull Then
             Begin
               CheqBloqCM.LocalDiferido   := EdtLocalEmissCheque.Text;
               CheqBloqCM.DataDiferido    := qrycheque.FieldByName('DATADIFERIDO').AsDateTime;
             End
             Else
               CheqBloqCM.LocalDiferido   := '';

             If Not CheqBloqCM.GeraCheque Then abort;

             qrycheque.next;
         End;
         CheqBloqCM.Imprime;
      End;
   Finally
      CheqBloqCM.Free;
   End;

end;

procedure TFrmEmissCheque.GravaEmissao;
var
	NumChq,iCodLancFinanc: LongInt;
        sqlGrid,sData : String;
        bLanca:Boolean;
        sCodDoc, sNumCheqBord, sNumLote: String;
        liRetFuncao,
        liExercicio, liPeriodo,liEmpresa :Integer;
        sMens :String;
        sHistAlteracao :String;
        sHistAlter: Array [0..4] of String;
        y :Integer;
        iPlanilhaChq :Double;        
begin

     	if MsgDlg('Os cheques foram impressos corretamente ?',
         	'Confirmação',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
            begin
             Try
               bRepeteImpressao := False;
               If Not DtmBaseDados.DbBaseDados.Intransaction Then DtmBaseDados.DbBaseDados.StartTransaction;

               qryLotePagto.Close;
               qryLotePagto.SQL.Text := 'SELECT NUMLOTE, DATAEMISSAO, DATADIFERIDO ' +
                                        ' FROM ' +
                                        ' LOTEPAGTO ' +
                                        'WHERE ' +
                                        ' (IDPESSOA = '+IntToStr(( sistema.idEmpresa ))+') AND' +
                                        ' (CODPORTFORMA = ' + dblkFormaPag.lookupValue + ') AND ' +
                                        ' (NUMLOTE IN (' + sNumLoteChecked + ')) AND' +
                                        ' ((FLAGEMISSAO = ''0'') OR (FLAGEMISSAO IS NULL)) AND ' +
                                        ' ((FLAGCANCEL = ''0'') OR (FLAGCANCEL IS NULL)) ' +
                                        'ORDER BY NUMLOTE';
               qryLotePagto.Open;

               bLanca := ((qryFormaRecPag.FieldByName('LancaFinanc').AsString = 'S') and
                          (IntegraBack.Financeiro <> 'N'));

               NumChq	:= Round(edtNumChq.Value)-1;
               qryLotePagto.First;
               while not qryLotePagto.Eof do
               begin
               	  Inc(NumChq);

                  If (Modulo.ControlaEmisCheque) Or
                     ((Not Modulo.ControlaEmisCheque) And (qryFormaRecPagFLGCONTROLACHEQUE.AsString = 'S')) Then
                  Begin
                     CtrlChequeEmis.ValidaPrimeiroCheque := False;
                     CtrlChequeEmis.MostraMsg    := True;
                     CtrlChequeEmis.VerificaChq  := True;
                     CtrlChequeEmis.CodPortador  := qryFormaRecPagCODPORTADOR.AsInteger;
                     CtrlChequeEmis.NumCheque    := NumChq;
                     CtrlChequeEmis.GravaNumChq  := True;
                     If Not CtrlChequeEmis.ValidaNumCheque Then Abort;
                  End;

                  If qryLotePagto.FieldByName('DATADIFERIDO').IsNull Then
                  Begin
                     If CkData.Checked Then
                        sData := qryLotePagto.FieldByName('DataEmissao').AsString
                     Else
                        sData := DtEmis.Text;
                  End
                  Else
                     sData := qryLotePagto.FieldByName('DATADIFERIDO').AsString;

                  if bLanca then
                  Begin
                     if IntegraBack.RecPag = 'P' then
                        sqlGrid       := ' SELECT  (''D'') as DEBCRE, '
                     else
                        sqlGrid       := ' SELECT  (''C'') as DEBCRE, ';

                     sqlGrid := sqlGrid +  ' DOC.DATAPROGRAMADA,                               '+
                                           ' lote.codportforma ,            '+
                                           ' DOC.IDPESSOA,  pess.nome,                         '+
                                           ' DOC.DATAVENCTO,                                   '+
                                           ' DOC.NoDOCUMENTO,                                  '+
                                           ' DOC.COMPLDOCUMENTO,                               '+
                                           ' DOC.CODDOCUMENTO,                                 '+
                                           ' DOC.OPERACAO, LOTE.NUMLOTE,                       '+
                                           ' DOC.PLANO , DOC.PLACONTA,  DOC.CODCENTROCUSTO,    '+
                                           ' LOTE.CODLANCFINANC,                               '+
                                           ' LOTEX.VALOR,lote.numchqbordero, '+
                                           ' LOTEX.FLGBAIXA                    '+
                                           ' FROM  ' +
                                           ' DOCUMENTO DOC, ' +
                                           ' PESSOA PESS, ' +
                                           ' LOTEXDOCUM LOTEX , ' +
                                           ' lotepagto lote ' +
                                           ' WHERE (LOTEX.NUMLOTE      = '+qryLotePagto.FieldByName('NUMLOTE').AsString         + ')   AND ' +
                                           '       (DOC.IDPESSOA       = ' +InttoStr(Sistema.IdEmpresa)                         + ')   AND ' +
                                           '       (DOC.RECPAG         = ''' + IntegraBack.RecPag                               + ''') AND ' +
                                           '       (LOTEX.FLGBAIXA     = '' ''  OR LOTEX.FLGBAIXA IS NULL) AND (LOTE.NUMLOTE = LOTEX.NUMLOTE) AND ' +
                                           '       (DOC.IDFORCLI       = PESS.IDPESSOA) AND (LOTEX.CODDOCUMENTO = DOC.CODDOCUMENTO)';

                     FazQuery(dtmBaseDados.Qry,sqlGrid);

                     If dtmBaseDados.Qry.FieldByname('OPERACAO').AsString <> '10' Then
                     Begin
                        sData := DateToStr(Documento.AjustaDataFloat(StrToDate(sData),qryFormaRecPagDMAIS.AsInteger));
                        LancFinanc.FazerRateioCAPCAR(dtmBaseDados.Qry,'C',IntToStr(NumChq),sData,IntegraBack.RecPag,qryLotePagto.FieldByName('NUMLOTE').AsInteger,StrToInt(dblkFormaPag.LookUpValue),iCodLancFinanc);
                        if iCodLancFinanc = -1 then abort
                     End
                     Else
                     Begin
                       if dtmBaseDados.Qry.FieldByName('OPERACAO').AsString = '10' Then
                       Begin
                          sCodDoc      := dtmBaseDados.Qry.FieldByName('CODDOCUMENTO').AsString;
                          sNumCheqBord := IntToStr(NumChq);
                          sNumLote     := dtmBaseDados.Qry.FieldByName('NUMLOTE').AsString;

                          //Altera o RecbToPagto Para o novo número do cheque e para a data de emissão do cheque
                          If ExecutarQuery(DtmBaseDados.Qry,'UPDATE RECBTOPAGTO SET ' +
                             ' NUMCHQBORDERO = ''' + sNumCheqBord +
                             ''', NUMLOTE = ' + sNumlote +
                             ', DATACFLOAT = TO_DATE(''' + sData + ''',''DD/MM/YYYY'') WHERE CODDOCUMENTO = ' + sCodDoc) Then
                          Begin
                              If FazQuery(DtmBaseDados.Qry,'SELECT CODLANCFINANC FROM RECBTOPAGTO WHERE CODDOCUMENTO = ' + sCodDoc) Then
                              Begin
                                   //Altera o Histórico da movimfinanc, nº do cheque e data de lançamento
                                   If ExecutarQuery(DtmBaseDados.Qry,'UPDATE MOVIMFINANC SET ' +
                                      ' NUMCHQBORDERO = ''' + sNumCheqBord +
                                      ''', HISTORICO = ''CHEQUE Nº ' + sNumCheqBord +
                                      ''', DATALANCFINAN = TO_DATE(''' + sData + ''',''DD/MM/YYYY'') ' +
                                      ' WHERE CODLANCFINANC = ' + DtmBaseDados.Qry.Fields[0].AsString) Then
                                   Begin
                                      //Altera data do lançamento na lanctodocum
                                      If ExecutarQuery(DtmBaseDados.Qry,'UPDATE LANCTODOCUM SET ' +
                                         ' DATALANCTO = TO_DATE(''' + sData + ''',''DD/MM/YYYY'') ' +
                                         ' WHERE CODDOCUMENTO = ' + sCodDoc) Then
                                      Begin
                                        //Altera data e histórico da planilha
                                        If FazQuery(DtmBaseDados.Qry,'SELECT PLNCODIGO FROM LANCTODOCUM WHERE CODDOCUMENTO = ' + sCodDoc +
                                           ' AND RTRIM(OPERACAO) = ''10''') Then
                                        Begin
                                           liPeriodo := 0;
                                           liExercicio := 0;
                                           liEmpresa:=Sistema.IdEmpresa;

                                           liRetFuncao:=TestaPeriodo(True,'BASEDADOS',sData,IntToStr(Sistema.IdModulo),liExercicio,
                                                                     liPeriodo,liEmpresa,sMens);

                                           if liRetFuncao <> 0 then Abort;

                                           iPlanilhaChq := DtmBaseDados.Qry.Fields[0].AsFloat;

                                           If Not ExecutarQuery(DtmBaseDados.Qry,'UPDATE PLANILHA SET ' +
                                                 ' PLNDATDIA = TO_DATE(''' + sData + ''',''DD/MM/YYYY''), ' +
                                                 ' PEREXERCICIO = ' + IntToStr(liExercicio) + ',' +
                                                 ' PERNUMERO = ' + IntToStr(liPeriodo) + ' ' +
                                                 ' WHERE PLNCODIGO = ' + FloatToStr(iPlanilhaChq) ) Then
                                              Raise EdataBaseError.Create('Não foi possível atualizar data do lançamento do documento Doc ' +
                                                                          sCodDoc + ', verifique')
                                              Else
                                              Begin
                                                 If FazQuery(DtmBaseDados.Qry,'SELECT LACHIST1,LACHIST2,LACHIST3,LACHIST4,LACHIST5 FROM LANCAMENTO WHERE PLNCODIGO = ' +
                                                                              FloatToStr(iPlanilhaChq) +
                                                                              ' AND LACNUMLAN = 1 ') Then
                                                 Begin
                                                    sHistAlteracao := '';
                                                    For y:=0 To 4 Do
                                                    Begin
                                                        sHistAlter[y] := '';
                                                        sHistAlteracao := sHistAlteracao + DtmBaseDados.Qry.Fields[Y].AsString + ' ';
                                                    End;
                                                    sHistAlteracao := sHistAlteracao + ' CHEQUE Nº ' + sNumCheqBord;
                                                    FuncaoGeral.ArrumaHistorico(sHistAlteracao,sHistAlter[0],sHistAlter[1],sHistAlter[2],sHistAlter[3],sHistAlter[4]);
                                                    If Not ExecutarQuery(DtmBaseDados.Qry,'UPDATE LANCAMENTO SET ' +
                                                                                          ' LACHIST1 = ''' + sHistAlter[0] + ''',' +
                                                                                          ' LACHIST2 = ''' + sHistAlter[1] + ''',' +
                                                                                          ' LACHIST3 = ''' + sHistAlter[2] + ''',' +
                                                                                          ' LACHIST4 = ''' + sHistAlter[3] + ''',' +
                                                                                          ' LACHIST5 = ''' + sHistAlter[4] + '''' +
                                                                                          ' WHERE PLNCODIGO = ' +  FloatToStr(iPlanilhaChq) +
                                                                                          ' AND LACNUMLAN = 1 ') Then
                                                       Raise EdataBaseError.Create('Não foi possível atualizar histórico do lançamento contábil do documento Doc ' +
                                                            sCodDoc + ', verifique');

                                                 End;
                                              End;
                                        End;
                                      End
                                      Else
                                        Raise EdataBaseError.Create('Não foi possível atualizar data do lançamento do documento Doc ' +
                                                                    sCodDoc + ', verifique');
                                   End
                                   Else
                                     Raise EdataBaseError.Create('Não foi possível atualizar movimento financeiro para o Doc ' +
                                                                 sCodDoc + ', verifique');
                              End
                              Else
                                 Raise EdataBaseError.Create('Erro ao selecionar movimento financeiro para o Doc ' +
                                                              sCodDoc + ', verifique');
                          End
                          Else
                             Raise EdataBaseError.Create('Não foi possível atualiar Nº do Cheque\Borderô para o Doc ' +
                                                          sCodDoc + ', verifique');

                          Documento.EmiteLancaBaixa(StrToInt(sCodDoc),true);
                       End;
                     End;
                  end;

                  qryUpdate.Close;
                  qryUpdate.SQL.Clear;
                  qryUpdate.SQL.Add('UPDATE LotePagto SET ');
                  qryUpdate.SQL.Add('NUMCHQBORDERO = :NumChq,' );
                  qryUpdate.SQL.Add('DATAEMISSAO = TO_DATE(:PDataEmissao,''DD/MM/YYYY''),' );

                  bLanca:=False;

                  if (qryFormaRecPag.FieldByName('LancaFinanc').AsString = 'S') and
                     (IntegraBack.Financeiro <> 'N') And (iCodLancFinanc <> 0) Then
                  Begin
                     qryUpdate.SQL.Add('CODLANCFINANC = :Pcodlancfinanc,' );
                     bLanca:=True;
                  end;

                  qryUpdate.SQL.Add('FLAGEMISSAO = ''1'' ');
                  qryUpdate.SQL.Add('WHERE IDPESSOA = :Pessoa AND ');
                  qryUpdate.SQL.Add('NUMLOTE        = :Lote');

                  qryUpdate.Params.ParamByName('Pessoa').AsInteger	:= sistema.idEmpresa;
                  qryUpdate.Params.ParamByName('Lote').AsInteger	:= qryLotePagto.FieldByName('NUMLOTE').AsInteger;
                  qryUpdate.Params.ParamByName('NumChq').AsInteger 	:= NumChq;

                  if bLanca And (iCodLancFinanc <> 0) then
                     qryUpdate.Params.ParamByName('Pcodlancfinanc').AsInteger := iCodLancFinanc;

                  qryUpdate.Params.ParamByName('Pdataemissao').AsString  := sData;
                  qryUpdate.ExecSql;

                  If qryUpdate.RowsAffected = 0 Then Abort;

                  If (qryFormaRecPagFLGCONTABEMISCHQ.AsString = 'S')  Then ContabilizaEmissao(qryLotePagto.FieldByName('NUMLOTE').AsInteger,NumChq);

                  qryLotePagto.Next;
               end;

               edtNumChq.Text:='';

               qryLotePagto.Close;
               qryLotePagto.SQL.Text := 'SELECT LP.NUMLOTE, PF.DESCRICAO ' +
                                        'FROM ' +
                                        ' LOTEPAGTO LP, PORTADORFORMA PF ' +
                                        'WHERE ' +
                                        ' ((LP.FLAGEMISSAO IS NULL) OR (LP.FLAGEMISSAO = ''0'')) AND ' +
                                        ' ((FLAGCANCEL IS NULL) OR (FLAGCANCEL = ''0''))  AND ' +
                                        ' (LP.CODPORTFORMA = LP.CODPORTFORMA) '  +
					'ORDER BY NUMLOTE';
               qryLotePagto.Open;

               ClCheques.Items.Clear;
               dblkFormaPag.Clear;

               qryparamchq.sql.clear;
               qryparamchq.sql.add('update paramcap set ') ;
               if  bdestinase then
                  qryparamchq.sql.add('flgdestinase=0,')
               else
                  qryparamchq.sql.add('flgdestinase=1,') ;

               if  bdocto then
                  qryparamchq.sql.add('flgdocto=0,')
               else
                  qryparamchq.sql.add('flgdocto=1,') ;

               if  bdtprog then
                  qryparamchq.sql.add('flgdtprog=0,')
               else
                  qryparamchq.sql.add('flgdtprog=1,') ;

               if  bvalor then
                  qryparamchq.sql.add('flgvalor=0,')
               else
                  qryparamchq.sql.add('flgvalor=1,') ;

               if  bforn then
                  qryparamchq.sql.add('flgforn=0,')
               else
                  qryparamchq.sql.add('flgforn=1,') ;

               if  bhist then
                  qryparamchq.sql.add('flghist=0,')
               else
                  qryparamchq.sql.add('flghist=1,') ;

               if  blocal then
                  qryparamchq.sql.add('flglocal=0')
               else
                  qryparamchq.sql.add('flglocal=1') ;
               qryparamchq.sql.add('where idpessoa='+inttostr(sistema.idempresa)) ;
               qryparamchq.sql.add('and recpag=''P''');
               qryparamchq.ExecSQL;

               If Not Sistema.GravaLogOperacoes('Emissao de Documento Cheque') Then
                  Raise Exception.Create('Não Consegui Gravar o Log');


               If DtmBaseDados.DbBaseDados.Intransaction Then DtmBaseDados.DbBaseDados.Commit;

             Except
               If DtmBaseDados.DbBaseDados.Intransaction Then DtmBaseDados.DbBaseDados.Rollback;
               MsgDlg('Não Foi Possível Registrar este Cheque.','Erro',mtError,[mbOK],0);
               Raise;
             End;
            end
            Else
              bRepeteImpressao := True;
end;


procedure TFrmEmissCheque.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  ClCheques.Items.Clear;
  dblkFormaPag.Clear;
end;

procedure TFrmEmissCheque.bbtnSairClick(Sender: TObject);
begin
  inherited;
  bRepeteImpressao := False;
end;

procedure TFrmEmissCheque.FormCreate(Sender: TObject);
begin
  inherited;


  qryparamchq.sql.clear;
  qryparamchq.sql.add('select flgdestinase ,     flgdocto   ,     flgdtprog   ,');
  qryparamchq.sql.add(' flgvalor   , flgforn ,  flghist   ,  flglocal, CodPortForma  from paramcap ');
  qryparamchq.sql.add(' where recpag=''P'' and idpessoa='+inttostr(sistema.idempresa));
  qryparamchq.open;

  sCodPortadorForma := qryparamchq.fieldbyname('CodPortForma').AsString;


  bdestinase:=qryparamchq.fieldbyname('flgdestinase').asinteger=0;
  bdocto:=qryparamchq.fieldbyname('flgdocto').asinteger=0;
  bdtprog:=qryparamchq.fieldbyname('flgdtprog').asinteger=0;
  bvalor:=qryparamchq.fieldbyname('flgvalor').asinteger=0;
  bforn:=qryparamchq.fieldbyname('flgforn').asinteger=0;
  bhist:=qryparamchq.fieldbyname('flghist').asinteger=0;
  blocal:=qryparamchq.fieldbyname('flglocal').asinteger=0;
  qryparamchq.close;

  CtrlChequeEmis := TCtrlCheque.Create;

  DtEmis.Date := Date;
  bRepeteImpressao := False;

  If FazQuery(QryAux,'SELECT LOCALEMISCHEQUE FROM PARAMCAP WHERE IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) + ' AND RECPAG = ''' + IntegraBack.RecPag + '''') Then
     EdtLocalEmissCheque.Text := QryAux.Fields[0].AsString;
  If QryAux.Active Then QryAux.Close;

  CmbModelo.Items.Text := CmCheque.ModelosImpressoras;
  CmbModelo.ItemIndex := 0;
  ComboBoxDeviceName.ItemIndex := 0;
  CmCheque.DeviceName := ComboBoxDeviceName.Text;

  CmCheque.BaudRate   := br9600;
  CmCheque.DataBits   := db8;
  CmCheque.DeviceName := 'COM1';
  CmCheque.Parity     := paNone;
  CmCheque.StopBits   := sb1;
end;

procedure TFrmEmissCheque.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  Canclose := Not bRepeteImpressao;
end;

procedure TFrmEmissCheque.CkDataClick(Sender: TObject);
begin
  inherited;
  DtEmis.Enabled := Not CkData.Checked;
end;

procedure TFrmEmissCheque.CkbMaquinaClick(Sender: TObject);
begin
  inherited;
  GpMaqCheque.Enabled := CkbMaquina.Checked;
end;

procedure TFrmEmissCheque.CmbModeloChange(Sender: TObject);
begin
  inherited;
  Case CmbModelo.ItemIndex of
    0:CmCheque.NomeImpressora := niChronos_ACC100;
    1:CmCheque.NomeImpressora := niChronos_ACC300;
  End;
end;

function TFrmEmissCheque.ImprimeChequeMac:Boolean;
var
  sData,
  sValor,
  sMsg: string;
  sLinhasCheque: array [0..15] of string;
  X,
  iTotLinhas: Integer;
begin
  try
    Result := True;
    qrycheque.First;
    while not qrycheque.eof do
    begin
      if Application.MessageBox('Prepare a impressora, insira o novo cheque e confirme',
                                'Aguardando Comando...',
                                Mb_IconInformation + Mb_OkCancel
                               ) = Id_Cancel Then
        Abort;

      if qrycheque.FieldByName('NUMBANCO').IsNull then
      begin
        Msgdlg('O número do banco tem que estar preenchido', 'Aviso', mterror, [mbOk], 0);
        Abort;
      End;

      if CkData.Checked then
        sData := qrycheque.FieldByName('DataEmissao').AsString
      else
        sData := DtEmis.Text;

      sValor := Trim(FloatToStrF(qryCheque.FieldByName('VALOR').AsFloat,ffnumber, 17, 2));
      while Pos('.', sValor) <> 0 do
         Delete(sValor, Pos('.', sValor), 1);

      Frmselversoch := nil;

      if CmCheque.Inicializar then
      begin
        CmCheque.Valor      := sValor;
        CmCheque.Favorecido := qryCheque.FieldByName('FAVORECIDO').AsString;
        CmCheque.Localidade := EdtLocalEmissCheque.Text;
        CmCheque.Data       := Copy(sData, 1, 6) + Copy(sData, 9, 2);
        CmCheque.CodBanco   := qryCheque.FieldByName('NUMBANCO').AsString;
        CmCheque.Imprime;

        if CkbVersoCheque.Checked then
        begin
          if Application.MessageBox('Insira o cheque para impressão do verso confirme',
                                    'Aguardando Comando...',
                                     Mb_IconInformation + Mb_OkCancel
                                   ) = Id_Cancel Then
            Abort
          else
          begin
            if QryDocsLote.Active then
              QryDocsLote.Close;

            if not QryDocsLote.Prepared then
              QryDocsLote.Prepare;

            QryDocsLote.ParamByName('NUMLOTE').AsFloat :=
                                   qryCheque.FieldByName('NUMLOTE').AsFloat;

            QryDocsLote.Open;

            if not QryDocsLote.IsEmpty then
            begin
              try
                Application.CreateForm(TfrmMensVersoCheque, frmMensVersoCheque);
                Application.CreateForm(TFrmselversoch, Frmselversoch);
                for X := 0 to 15 do
                  sLinhasCheque[x] := '';
                frmMensVersoCheque.MemVersoCheque.Clear;

                Frmselversoch.chkdestinase.checked := bdestinase;
                Frmselversoch.chkdocto.checked     := bdocto;
                Frmselversoch.chkdtprog.checked    := bdtprog;
                Frmselversoch.chkvalor.checked     := bvalor;
                Frmselversoch.chkforn.checked      := bforn;
                Frmselversoch.chklocal.checked     := blocal;
                Frmselversoch.chkhist.checked      := bhist;

                Frmselversoch.ShowModal;
                bdestinase := Frmselversoch.chkdestinase.checked;
                bdocto     := Frmselversoch.chkdocto.checked;
                bdtprog    := Frmselversoch.chkdtprog.checked;
                bvalor     := Frmselversoch.chkvalor.checked;
                bforn      := Frmselversoch.chkforn.checked;
                blocal     := Frmselversoch.chklocal.checked;
                bhist      := Frmselversoch.chkhist.checked;

                if Frmselversoch.chkdestinase.checked then
                  frmMensVersoCheque.MemVersoCheque.Lines.Add(
                                            'Destina-se este cheque para:');

  // -----------------------------------------------------------------------------
  // Fábio Barros - 25/03/2002
  // Só deve fazer o teste com a quantidade de fornecedores se NÃO informar o
  // histórico.
  // -----------------------------------------------------------------------------
                if not Frmselversoch.ChkDestinase.Checked then
                begin
                  X := 1;
                  QryDocsLote.First;
                  while not QryDocsLote.Eof do
                  begin
                    smsg:='';

                    // numero do documento
                    if Frmselversoch.chkdocto.checked then
                      smsg := 'Nº '+
                        FormatFloat('###,###,###,###,###,###,###',
                                    QryDocsLoteNODOCUMENTO.AsFloat)+
                        ' '+Trim(QryDocsLoteCOMPLDOCUMENTO.AsString);

                    // data programada
                    if Frmselversoch.chkdtprog.checked then
                      smsg := smsg + ' de ' + QryDocsLoteDATAPROGRAMADA.AsString;

                    // valor
                    if Frmselversoch.chkvalor.checked then
                      smsg := smsg + ' valor: ' +
                        FormatFloat('#,##0.00', Abs(QryDocsLoteVALOR.AsFloat));

                    // adicione ao verso do cheque
                    if trim(smsg) <> '' then
                      frmMensVersoCheque.MemVersoCheque.Lines.Add(smsg);

                    smsg := '';

                    // fornecedor
                    if Frmselversoch.chkforn.checked then
                      smsg := ' para: ' + QryDocsLoteFORNECEDOR.AsString ;

                    // historico
                    if Frmselversoch.chkhist.checked then
                      smsg := smsg + ' ' + QryDocsLoteHISTORICOCOMPL.AsString;

                    // adicione ao verso do cheque
                    if trim(smsg) <> '' then
                      frmMensVersoCheque.MemVersoCheque.Lines.Add(smsg);

                    Inc(X);

                    // _^o^_ - verso cheque avisar
                    // maximo de 13 documentos por verso do cheque
                    if X = 13 then
                    begin
                      if Application.MessageBox
                        (
                          'Fornecedores não caberâo no verso do cheque.',
                          'Aguardando Comando...',
                          Mb_IconInformation + Mb_OkCancel
                        ) = Id_Cancel Then
                      begin
                        Abort;
                      end
                      else
                      begin
                        QryDocsLote.Last;
                      end;
                    end
                    else
                      QryDocsLote.Next;
                  end;
// -----------------------------------------------------------------------------
                  // local de emissao
                  if  Frmselversoch.chklocal.checked then
                  begin
                    frmMensVersoCheque.MemVersoCheque.Lines.Add('');
                    frmMensVersoCheque.MemVersoCheque.Lines.Add(
                      EdtLocalEmissCheque.Text +
                      ', ' +
                      FormatDateTime('d "de" mmmm "de" yyyy', StrToDate(sData)));
                  end;
                  frmMensVersoCheque.MemVersoCheque.Lines.Add('');
                end;

                if (frmMensVersoCheque.ShowModal = MrOk) Then
                begin
                  iTotLinhas := frmMensVersoCheque.MemVersoCheque.Lines.Count - 1;

                  // _^o^_ - verso cheque avisar
                  if iTotLinhas > 15 then
                    iTotLinhas := 15;

                  // dezesseis linhas
                  for X := 0 to iTotLinhas do
                  begin
                    if Trim(frmMensVersoCheque.MemVersoCheque.Lines[x]) = '' then
                      sLinhasCheque[x] := '.'
                    else
                      sLinhasCheque[x] :=
                        Espaco(' ', 10)+
                        frmMensVersoCheque.MemVersoCheque.Lines[x];
                  end;
                  CmCheque.ImprimeVerso(sLinhasCheque);
                end;

              except
                //if Frmselversoch<> nil then  Frmselversoch.release;
                //frmMensVersoCheque.Free;
              end;
            end;
          end;
        end;
      end
      else
        Abort;

      qryCheque.next;
    end;
  except
    //if Frmselversoch<> nil then
    //Frmselversoch.Free;
    Result := False
  end;
  //O Erro é aqui !
  //if Frmselversoch<> nil then   Frmselversoch.release;
end;

procedure TFrmEmissCheque.ComboBoxDeviceNameChange(Sender: TObject);
begin
  inherited;
  CmCheque.DeviceName := ComboBoxDeviceName.Text;
end;

procedure TFrmEmissCheque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlChequeEmis.Free;
end;

procedure TFrmEmissCheque.ContabilizaEmissao(iNumLote,iNumChq: Integer);
Var
 sDebCre, ssubcontacre, cCCustd, cContad, cCCustc, cContac, sDataLanc, sNumTit, sMens,
 ssubconta, sHistorico, sHisto1, sHisto2, sHisto3, sHisto4, sHisto5: String;
 rValHistCre, rValHistDed, rvalorLote : Real;
 iPlnCodigo, liEmpresa: LongInt;
Begin
  If qryCheque.Locate('NUMLOTE',iNumLote,[]) Then
  Begin
    QryBuscaRateio.Close;
    QryBuscaRateio.ParamByName('NUMLOTE').AsFloat := iNumLote;
    QryBuscaRateio.Open;

    while not QryBuscaRateio.eof do
    begin
       sNumTit := IntToStr(iNumChq);

       liEmpresa := Sistema.idEmpresa;

       If CkData.Checked Then
         sDataLanc := qrycheque.FieldByName('DataEmissao').AsString
       Else
         sDataLanc := DtEmis.Text;

       liRetFuncao:=TestaPeriodo(True,
                                 'BaseDados',
                                 sDataLanc,
                                 IntToStr(Sistema.IdModulo),
                                 liExercicio,
                                 liPeriodo,
                                 liEmpresa,
                                 sMens);

       if liRetFuncao <> 0 then Abort;

       //rvalorLote   := qrycheque.FieldByName('VALOR').AsFloat;
       rvalorLote   := QryBuscaRateio.FieldByName('VALORRATEIOLOTE').AsFloat;

       sDebCre      := FuncaoGeral.Decode(IntegraBack.RecPag,'R','C','D');
       cCCustd      := qryFormaRecPagCODCENTROCUSTO.AsString;
       cContad      := qryFormaRecPagPLACONTACONTABCHQ.AsString;;
       rValHistDed  := rvalorLote;
       ssubconta    := FuncaoGeral.Decode(qryFormaRecPagCODSUBCONTA.AsInteger,0,'',qryFormaRecPagCODSUBCONTA.AsString);
       cCCustc      := '';
       cContac      := '';
       rValHistCre  := 0;
       ssubcontacre := '';

       sHistorico := 'Emissão de Cheque Nº ' + IntToStr(iNumChq);

       FuncaoGeral.ArrumaHistorico(sHistorico,
                                   sHisto1,
                                   sHisto2,
                                   sHisto3,
                                   sHisto4,
                                   sHisto5);

       iPlnCodigo := LANCACONTAB(True,'BASEDADOS', sDataLanc, IntToStr(Sistema.IdModulo), '0',
       sDebCre,'','','','','','','','','','',
       sNumTit,
       sHisto1,
       sHisto2,
       sHisto3,
       sHisto4,
       sHisto5,
       '03', cCCustD, cContaD, cCCustC, cContaC, liExercicio, liPeriodo,Sistema.IdEmpresa,Sistema.IdUsuario,
       IntegraBack.Plano, rvalorLote,
       0,0,0,0,0,0,0,0,IntToStr(IntegraBack.uNidNegoc), false, rValHistDed, rValHistCre,
       ssubconta, ssubcontacre,'','', iPlnCodigo, sMens ,IntegraBack.MascaraPlano,True,0,
       QryBuscaRateio.FieldByName('IDPLANOPREV').AsInteger,
       QryBuscaRateio.FieldByName('IDPATRO').AsInteger,
       Sistema.UsaPlanoPatro);

       if iPlnCodigo <= 0 then Abort;

       //Lançamento contábil a Crédito fornecedor
       sDebCre      := FuncaoGeral.Decode(IntegraBack.RecPag,'R','D','C');
       cCCustd      := '';
       cContad      := '';
       rValHistDed  := 0;
       ssubconta    := '';
       cCCustc      := qryFormaRecPagCODCENTROCUSTO.AsString;
       cContac      := qryFormaRecPagPLACONTA.AsString;
       rValHistCre  := rvalorLote;
       ssubcontacre := FuncaoGeral.Decode(qryFormaRecPagCODSUBCONTA.AsInteger,0,'',qryFormaRecPagCODSUBCONTA.AsString);

       iPlnCodigo := LANCACONTAB(True,'BASEDADOS', sDataLanc, IntToStr(Sistema.IdModulo), '1',
       sDebCre,'','','','','','','','','','',
       sNumTit,
       sHisto1,
       sHisto2,
       sHisto3,
       sHisto4,
       sHisto5,
       '03', cCCustD, cContaD, cCCustC, cContaC, liExercicio, liPeriodo,Sistema.IdEmpresa,Sistema.IdUsuario,
       IntegraBack.Plano, rvalorLote,
       0,0,0,0,0,0,0,0,IntToStr(IntegraBack.uNidNegoc), false, rValHistDed, rValHistCre,
       ssubconta, ssubcontacre,'','', iPlnCodigo,sMens,IntegraBack.MascaraPlano,True,0,
       QryBuscaRateio.FieldByName('IDPLANOPREV').AsInteger,
       QryBuscaRateio.FieldByName('IDPATRO').AsInteger,
       Sistema.UsaPlanoPatro);

       if iPlnCodigo <= 0 then
       Begin
          iPlnCodigo := -1;
          Abort;
       End;

       QryBuscaRateio.Next;
    end;

    if iPlnCodigo > 0 then
      If Not ExecutarQuery(DtmBaseDados.Qry,'UPDATE LOTEPAGTO SET PLNCODIGO = ' + IntToStr(iPlnCodigo) + ' WHERE NUMLOTE = ' +
             IntToStr(iNumLote)) Then Abort;
  End;
End;

procedure TFrmEmissCheque.SbAdTodosClick(Sender: TObject);
Var
  X: Integer;
begin
  inherited;
  For X:=0 To ClCheques.Items.Count - 1 Do
      ClCheques.Selected[x] := True;
end;

procedure TFrmEmissCheque.SbAdInverteClick(Sender: TObject);
Var
  X: Integer;
begin
  inherited;
  For X:=0 To ClCheques.Items.Count - 1 Do
      ClCheques.Selected[x] := Not ClCheques.Selected[x];
end;

procedure TFrmEmissCheque.dblkFormaPagChange(Sender: TObject);
begin
  inherited;

// -----------------------------------------------------------------------------
// Pega o número do último cheque. Fábio Barros - 05/04/2002
// -----------------------------------------------------------------------------
  with qryUltCheque do
  begin
    if Active then Close;
    ParamByName('pCODPORTADOR').AsFloat := qryFormaRecPag.FieldByName('CODPORTADOR').AsFloat;
    Open;
    edtNumChq.Value := 0;
    while not EOF do
    begin
      if FieldByName('NUMPROXIMOCHEQUE').AsFloat < FieldByName('NUMCHEQUEFINAL').AsFloat then
      begin
        edtNumChq.Value := FieldByName('NUMPROXIMOCHEQUE').AsFloat;
        Break;
      end;
      Next;
    end;
  end;
// -----------------------------------------------------------------------------

  If Trim(dblkFormaPag.Text) = '' Then Exit;

  qryLotePagto.Close;
  qryLotePagto.SQL.Clear;
  sSql := '';
  sSQL := sSQL +' WHERE ((FLAGEMISSAO IS NULL) OR (FLAGEMISSAO = ''0'')) AND ';
  sSQL := sSQL +'       ((FLAGCANCEL IS NULL) OR (FLAGCANCEL = ''0'')) AND ';
  sSQL := sSQL +'       (LOTEPAGTO.CODPORTFORMA = PORTADORFORMA.CODPORTFORMA) AND ';
  sSQL := sSQL +'        LotePagto.IDPESSOA = ' + InttoStr(sistema.IdEmpresa) + ' AND ';
  sSQL := sSQL +'        LOTEPAGTO.NUMLOTE  = LOTEX.NUMLOTE AND ';
  sSQL := sSQL +'        LOTEX.CODDOCUMENTO = DOC.CODDOCUMENTO AND (LotePagto.flagcancel <>''C'' or LotePagto.flagcancel is null) and ';
  sSQL := sSQL +'        DOC.RECPAG         = '''+ IntegraBack.RecPag +''' AND ';
  sSQL := sSQL +'        PORTADORFORMA.IDTEMPLCHEQUE = CHEQUE.IDTEMPLCHEQUE AND '+
                ' totlote.totdocum=totdocum.totdocum and '+
                ' totlote.numlote=totdocum.numlote and   totlote.numlote=  lotepagto.NUMLOTE and ';

  If Trim(dblkFormaPag.text) <> '' then
     sSQL := sSQL +' LOTEPAGTO.CODPORTFORMA  = '+ dblkFormaPag.LookupValue  +  '  AND '
  Else
     sSQL := sSQL +' LOTEPAGTO.CODPORTFORMA  = -1 AND ';


  if sSQL <> ''  then
    sSQL := Copy(sSQL, 1, Length(sSQL)-5);


  qryLotePagto.Sql.clear;
  qryLotePagto.SQL.Add(' SELECT distinct LOTEPAGTO.NUMLOTE,LOTEPAGTO.CODPORTFORMA,DESCRICAO , LOTEPAGTO.DATAEMISSAO, LOTEPAGTO.IDPROCESSO   '+
                       ' FROM ' + sistema.PrefixoServidor + 'LotePagto,'
                                + sistema.PrefixoServidor + 'LOTEXDOCUM LOTEX, '
                                + sistema.PrefixoServidor + 'DOCUMENTO DOC,     '
                                + sistema.PrefixoServidor + 'TEMPLCHEQUE CHEQUE,'
                                + sistema.PrefixoServidor + ' PortadorForma '+
                        ',(select count(*) as totdocum , numlote from lotexdocum ld , documento d where '+
                        '        D.RECPAG         = '''+ IntegraBack.RecPag +'''  AND '+
                        '        ((LD.FLGBAIXA  IN (''N'',''R''))  OR (LD.FLGBAIXA IS NULL))  AND '+
                        '         ld.CODDOCUMENTO = D.CODDOCUMENTO group by numlote  ) totdocum '+

                        ',(select count(*) as totdocum , numlote from lotexdocum ld , documento d where '+
                        '        D.RECPAG         = '''+ IntegraBack.RecPag +'''  AND '+
                        '        ((LD.FLGBAIXA  IN (''N'',''R''))  OR (LD.FLGBAIXA IS NULL)) AND  '+
                        '         ld.CODDOCUMENTO = D.CODDOCUMENTO  and '+
                        '         d.codtipdoc in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' +
                              IntegraBack.RecPag+''' and not exists  (select 1 from UsuarioxTpdocto b where recpag='+#39+integraback.recpag+#39+' and b.idusuario=' +
                              inttostr(sistema.IdUsuario)+') union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' +
                              IntegraBack.RecPag+ '''  and exists (select 1 from UsuarioxTpdocto b where recpag='+#39+integraback.recpag+#39+' and a.codtipdoc=b.codtipdoc and b.idusuario=' +
                              inttostr(sistema.idusuario)+')) group by numlote  ) totlote '+
                           sSql  + ' ORDER BY NUMLOTE'+'');
  qryLotePagto.Open;

  If Not qryLotePagto.IsEmpty Then
  Begin
    ClCheques.Items.Clear;
    While Not qryLotePagto.Eof Do
    Begin
       ClCheques.Items.Add(qryLotePagto.FieldByname('NUMLOTE').AsString);
       qryLotePagto.Next;
    End;
  End
  Else
    ClCheques.Items.Clear;
end;

end.
