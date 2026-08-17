unit FAlteraBeneficio;

// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//------------------------------------------------------------------------------
//SIG        : 124500
//Data       : 08/04/2022
//Responsável: Ewerton Beltramini
//Descrição..: Acrescentado campo em tela;
//------------------------------------------------------------------------------
//Rotina     : (dfm) QRY
//SIG        : 120129
//Data       : 26/10/2021
//Responsável: Edilaine
//Descrição..: Trazer dados do titular independente do plano
//------------------------------------------------------------------------------
//Rotina     : (dfm) CmeCadastroFind, sbtnAltDetClick, qryDetBeforePost
//SIG        : 118528
//Data       : 13/08/2021
//Responsável: Edilaine
//Descrição..: Ajuste interface e inclusao Valor SRB
//------------------------------------------------------------------------------
//SIG        : 103013
//Data       : 13/10/2020
//Responsável: Taffarel Sevaybriker
//Descrição..: Correção no update da Benefbfciario.
//------------------------------------------------------------------------------
//Rotina     : bbtnConfirmar
//SIG        : 102558
//Data       : 29/02/2020
//Responsável: Edilaine
//Descrição..: ajuste para salvar valorbasex na estrutura BENEFPLANOPART
//------------------------------------------------------------------------------
//SIG        : 97910
//Data       : 20/02/2020
//Responsável: Rafael Vasconcelos
//Descrição..: Correção na tela Alteração de Dados de Benefício quando digita o valor 0.
//------------------------------------------------------------------------------
//SIG        : 95504
//Data       : 30/12/2019
//Responsável: Rafael Vasconcelos
//Descrição..: Correção na tela Alteração de Dados de Benefício
//------------------------------------------------------------------------------
//SIG        : 93374
//Data       : 24/10/2019
//Responsável: Ewerton Beltramini
//Descrição..: Correção de erro ao salvar o Cálculo Retroativo de Benefício. 
//             Acrescentado campo em tela;
//------------------------------------------------------------------------------
//SIG        : 88847
//Data       : 17/10/2019
//Responsável: Ewerton Beltramini
//Descrição..: Troca de funcionalidade de um menu para outro. (Concessão/Alteração de Dados de Benefício)
//------------------------------------------------------------------------------
// Autor(a)  : Fernando Xavier
// Data      : 14/04/2011
// Pendencia : 141073/3661  KINTANA 1128912
// Alteração : Ajuste no controle de transações no Banco de Dados
//------------------------------------------------------------------------------
// Rotina      : BtMatriculaClick(
// Autor(a)    : Augusto
// Pendencia   : 17933
// Data        : 27/10/2004
// Descricao   : Permitir gerar matricula para beneficios do INSS
//------------------------------------------------------------------------------
// Rotina      : -----
// Autor(a)    : Augusto
// Data        : 08/10/2004
// Descricao   : Incluir geração de matricula 
//------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, CmEventosCadastro, ImgList, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc, Wwquery, MAHlpBtn, TB97Tlbr,
  StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TabControlDetalhe, ExtCtrls, DBCtrls, wwdbdatetimepicker,
  CMDateTimePicker, wwdblook, CMDBLookupCombo, Mask, wwdbedit, UAutorizacao,
  MskEdDlg;

type
  TfrmAlteraBeneficio = class(TfrmCadMestreDetalheCS)
    lblParticipante: TLabel;
    dbTNome: TDBText;
    lblPatro: TLabel;
    dbTPatro: TDBText;
    lblPlanoPrev: TLabel;
    dbTPlano: TDBText;
    lblMatricula: TLabel;
    dbTMatricula: TDBText;
    lblInscricao: TLabel;
    dbTInscricao: TDBText;
    edPaiDetalhe: TEdit;
    Label1: TLabel;
    DBText1: TDBText;
    qryPortForma: TwwQuery;
    dsPortForma: TwwDataSource;
    qryAgenciaResgate: TwwQuery;
    QryAux: TwwQuery;
    updDet: TUpdateSQL;
    QryPlanoContabil: TwwQuery;
    QryPlanoContabilIDPLANOPREV: TFloatField;
    QryPlanoContabilNOME: TStringField;
    DsPlanoContabil: TwwDataSource;
    QryPerfilInvestimento: TwwQuery;
    DsPerfilInvestimento: TwwDataSource;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lblValBase1: TLabel;
    lblValBase2: TLabel;
    lblValBase3: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    dbValBase1: TDBEdit;
    dbValBase2: TDBEdit;
    dbValBase3: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    qryDet: TwwQuery;
    QryUpAux: TQuery;
    Bevel2: TBevel;
    Label21: TLabel;
    dbNBInss: TDBEdit;
    pnlINSS: TPanel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    Bevel1: TBevel;
    cmdtpDER: TCMDateTimePicker;
    cmdtpDIB: TCMDateTimePicker;
    cmdtpDIBAnt: TCMDateTimePicker;
    cmdtpDIP: TCMDateTimePicker;
    cmdtpDtFim: TCMDateTimePicker;
    cmdtpDtEncerra: TCMDateTimePicker;
    cmdtIniINSS: TCMDateTimePicker;
    reVlrBenefAnt: TcmMaskEditDlg;
    reVlrBenefIni: TcmMaskEditDlg;
    lblSRB: TLabel;
    reVlrSRB: TcmMaskEditDlg;
    reVlrInfoINSS: TcmMaskEditDlg;
    DbeCAMPOTEXTO1: TDBEdit;
    Label8: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tbcDetalheChange(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure qryDet1AfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure dbedNumProcINSSExit(Sender: TObject);
    procedure qryDet1BeforePost(DataSet: TDataSet);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure BtMatriculaClick(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure qryDetAfterScroll(DataSet: TDataSet);
    procedure qryDetBeforePost(DataSet: TDataSet);
    function  CheckDate(Sender: TField; Text: String): Boolean;

    //edilaine SIG118528 : inicio
    {procedure qryDetDATAREQUERIMENTOSetText(Sender: TField;
      const Text: String);                                                  //Ewerton Beltramini SIG88487
    procedure qryDetDATAINICIOFUNDSetText(Sender: TField;
      const Text: String);                                                  //Ewerton Beltramini SIG88487
    procedure qryDetDATAFINALSetText(Sender: TField; const Text: String);   //Ewerton Beltramini SIG88487
    procedure qryDetDATAINICIOSetText(Sender: TField; const Text: String);  //Ewerton Beltramini SIG88487
    procedure qryDetDIBBENEFANTSetText(Sender: TField; const Text: String); //Ewerton Beltramini SIG88487
    procedure qryDetDATAENCERRAMENTOSetText(Sender: TField;
      const Text: String);
    }//edilaine SIG118528 : fim

    procedure reVlrBenefAntKeyPress(Sender: TObject; var Key: Char);
    procedure reVlrBenefIniKeyPress(Sender: TObject; var Key: Char);
    procedure reVlrSRBKeyPress(Sender: TObject; var Key: Char);
    procedure reVlrInfoINSSKeyPress(Sender: TObject; var Key: Char);


  private
    { Private declarations }
    sFiltroBenef ,
    OpDetalhe        : String;
  public
    { Public declarations }
    fValorBase1, fValorBase2, fValorBase3 : Double;

  end;

var
  frmAlteraBeneficio: TfrmAlteraBeneficio;

implementation

uses FPrincipal, UAdmPrev, UMensErro, UDataBase, UCalcDV, FTelaAut, DBaseDados, FCadResponsa,
  UBeneficio, fAguarde, DAPrev, Usistema, UModulo, UFuncoesUteis;

{$R *.DFM}




procedure TfrmAlteraBeneficio.FormActivate(Sender: TObject);
begin
  inherited;
  sbtnInserir.Visible := False;
  sbtnApagar.Visible  := False;
  sbtnInsDet.Visible := False;
end;

//Ewerton Beltramini SIG88487 - Criada Função abaixo.
function TfrmAlteraBeneficio.CheckDate(Sender: TField; Text: String): Boolean;
begin
        if (Text = '  /  /    ') then
        begin
              Sender.Clear;
              Result := True;
        end
        else
        begin
              try
                 StrToDate(Text);
                 Sender.AsString := Text;
                 Result := True;
              except
                 MessageDlg('Os campos de datas devem estar no formato DD/MM/AAAA!', mtInformation,[mbOk],0 );
                 Result := False;
              end;
        end;
end;


procedure TfrmAlteraBeneficio.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  edPaiDetalhe.Text := '';
  if MontaSelect.RetornouValor
  then  begin
    qry.Close;
    if not qry.Prepared then qry.prepare;
    qry.ParamByName('IDTITULAR').Value      := StrToInt(MontaSelect.ValoresChave[1]);
    qry.ParamByName('IDPESSJUR').Value      := StrToInt(MontaSelect.ValoresChave[3]);
    //qry.ParamByName('IDPLANOPREV').Value    := StrToInt(MontaSelect.ValoresChave[4]);   //edilaine SIG120129
    qry.ParamByName('SEQPROPOSTA').Value    := StrToInt(MontaSelect.ValoresChave[2]);
    qry.ParamByName('NUMEROPROCESSO').Value := StrToInt(MontaSelect.ValoresChave[0]);
    qry.Open;

    qryDet.Close;
    if not qryDet.Prepared then qryDet.prepare;
    qryDet.ParamByName('IDTITULAR').Value := StrToInt(MontaSelect.ValoresChave[1]);
    qryDet.ParamByName('NUMEROPROCESSO').Value := StrToInt(MontaSelect.ValoresChave[0]);
    qryDet.Open;
  end;
end;

procedure TfrmAlteraBeneficio.FormShow(Sender: TObject);
begin
  inherited;
  MontaSelect.Filtro.Add('PP.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')'); // CAMILLE - 25.06.2003
  qry.Close;
  if not qry.Prepared then qry.prepare;
  qry.ParamByName('IDTITULAR').Value   := 0;
  qry.ParamByName('IDPESSJUR').Value   := 0;
  //qry.ParamByName('IDPLANOPREV').Value := 0;    //edilaine SIG120129
  qry.ParamByName('SEQPROPOSTA').Value := 0;
  qry.Open;

  qryDet.Close;
  if not qryDet.Prepared then qryDet.prepare;
  qryDet.ParamByName('IDTITULAR').Value      := 0;
  qryDet.ParamByName('NUMEROPROCESSO').Value := 0;
  qryDet.Open;



end;

procedure TfrmAlteraBeneficio.tbcDetalheChange(Sender: TObject);
begin
  inherited;
  edPaiDetalhe.Text := qryDet.FieldByName('NOMEDEPENDENTE').AsString+' - '+qryDet.FieldByName('BENEFICIO').AsString;
end;

procedure TfrmAlteraBeneficio.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  qryDet.Close;
  qryDet.ParamByname('IDTITULAR').AsInteger      := qry.FieldByName('IDPESSOA').AsInteger;
  qryDet.ParamByName('NUMEROPROCESSO').AsInteger := qry.FieldByName('NUMEROPROCESSO').AsInteger;
  qryDet.Open;
end;

procedure TfrmAlteraBeneficio.CmeCadastroConfirma(Sender: TObject);
begin
  //SIG103013 - TAES - início
  // Dar o commit nesse ponto porque o inherited dá outro starttransaction
  //if dtmBaseDados.dbBaseDados.InTransaction
  //then dtmBaseDados.dbBaseDados.Commit;


  //inherited;
  //SIG103013 - TAES - fim
  
  try
     AplicaUpdatesInTrans([qryDet]) //SIG103013 - TAES
  except
    raise;
  end;
  
end;

procedure TfrmAlteraBeneficio.sbtnExcluiDetClick(Sender: TObject);
begin
 // inherited;
end;

procedure TfrmAlteraBeneficio.qryDet1AfterScroll(DataSet: TDataSet);
begin
  inherited;
  edPaiDetalhe.Text := qryDet.FieldByName('NOMEDEPENDENTE').AsString+' - '+qryDet.FieldByName('BENEFICIO').AsString;
end;

procedure TfrmAlteraBeneficio.FormCreate(Sender: TObject);
begin
  inherited;
  qryPortForma.Close;
  qryPortForma.Open;
  qryAgenciaResgate.Close;
  qryAgenciaResgate.Open;

  //edilaine SIG18528 : inicio
  QryPlanoContabil.close;
  QryPlanoContabil.open;
  QryPerfilInvestimento.close;
  QryPerfilInvestimento.open;
  //edilaine SIG18528 : fim
end;

procedure TfrmAlteraBeneficio.dbedNumProcINSSExit(Sender: TObject);
begin
  inherited;
  //Ewerton Beltramini SIG88487 - Comentario do codigo abaixo.
(*
  if (dbedNumProcINSS.text <> '') then
  begin
     if not ValidaNumProcesso(qrydet.fieldbyname('NUMPROCINSS').AsString) then
     begin
        if MsgDlg('O Número do Processo no INSS informado é INVÁLIDO. '+#13+
                  'Deseja manter este número e continuar a operação ?', Caption, mtError , [mbNo, mbYes], 0) = mrNo then
        begin
           if dbedNumProcINSS.CanFocus then dbedNumProcINSS.setfocus
        end;
     end;
  end;
*)
end;

procedure TfrmAlteraBeneficio.qryDet1BeforePost(DataSet: TDataSet);
begin
   // Fernando xavier  141073/3661  KINTANA 1128912
   Upd.ModifySQL.Clear;
   if qry.state in [DsEdit] then
      qry.CancelUpdates;
   // fernando Xavier  141073/3661  KINTANA 1128912
  if not qryDet.Active then Exit;

  inherited;

  //Ewerton Beltramini SIG88487 - Comentario abaixo.
(*
  if Trim(dblkpcmbPortForma.Text) <> ''
  then qryDet.FieldByName('DESCFORMA').AsString := qryPortForma.FieldByName('DESCRICAO').AsString
  else qryDet.FieldByName('DESCFORMA').AsString := '';

  if Trim(dblkpcmbAgencia.Text) <> ''
  then qryDet.FieldByName('AGENCIACREDITO').AsString := qryAgenciaResgate.FieldByName('NUMBANCO').AsString+'/Ag.'+qryAgenciaResgate.FieldByName('NUMAGENCIA').AsString
  else qryDet.FieldByName('AGENCIACREDITO').AsString := '';
*)
end;

procedure TfrmAlteraBeneficio.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  if not dtmBaseDados.dbBaseDados.InTransaction
  then dtmBaseDados.dbBaseDados.StartTransaction;
end;

procedure TfrmAlteraBeneficio.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;

  //if dtmBaseDados.dbBaseDados.InTransaction //SIG103013 - TAES
  //then dtmBaseDados.dbBaseDados.Commit; //SIG103013 - TAES

  if not dtmBaseDados.dbBaseDados.InTransaction
  then dtmBaseDados.dbBaseDados.StartTransaction;

  //Ewerton Beltramini SIG88487 - Criação do bloco abaixo.
  //Inicializando e carregando variaveis de controle...
//  if (fValorBase1 <>  0) or   -- SIG 97910
//     (fValorBase2 <>  0) or  -- SIG 97910
//     (fValorBase3 <>  0) then  -- SIG 97910


//edilaine SIG102558 - inicio
//  if (fValorBase1 <> -1) or   // SIG 97910
//     (fValorBase2 <> -1) or  // SIG 97910
//     (fValorBase3 <> -1) then  // SIG 97910
  begin
      QryUpAux.Close;
      QryUpAux.SQL.Clear;
      QryUpAux.Sql.add('UPDATE BENEFPLANOPART');
      QryUpAux.Sql.add('SET    VALORBASE1 = ' + Quotedstr(FormatFloat('#,##0.00',qryDet.FieldByName('VALORBASE1').AsFloat)) );
      QryUpAux.Sql.add('      ,VALORBASE2 = ' + Quotedstr(FormatFloat('#,##0.00',qryDet.FieldByName('VALORBASE2').AsFloat)) );
      QryUpAux.Sql.add('      ,VALORBASE3 = ' + Quotedstr(FormatFloat('#,##0.00',qryDet.FieldByName('VALORBASE3').AsFloat)) );
      QryUpAux.Sql.add('WHERE IDPESSOA    = ' + qryDet.FieldByName('IDPESSOA').AsString);
      QryUpAux.Sql.add('AND   IDBENEFICIO = ' + qryDet.FieldByName('IDBENEFICIO').AsString);
      QryUpAux.Sql.add('AND   IDPLANOPREV = ' + qryDet.FieldByName('IDPLANOPREV').AsString);
      QryUpAux.Sql.add('AND   (VALORBASE1 <> ' + Quotedstr(FormatFloat('#,##0.00', qryDet.FieldByName('VALORBASE1').AsFloat )) );
      QryUpAux.Sql.add(' OR    VALORBASE2 <> ' + Quotedstr(FormatFloat('#,##0.00', qryDet.FieldByName('VALORBASE2').AsFloat )) );
      QryUpAux.Sql.add(' OR    VALORBASE3 <> ' + Quotedstr(FormatFloat('#,##0.00', qryDet.FieldByName('VALORBASE3').AsFloat )) +' )');
      QryUpAux.ExecSQL;
//edilaine SIG102558 - fim

      //fValorBase1 := 0; fValorBase2 := 0; fValorBase3 := 0;    -- SIG 97910
      fValorBase1 := -1; fValorBase2 := -1; fValorBase3 := -1;  // SIG 97910
  end;

  if dtmBaseDados.dbBaseDados.InTransaction
  then dtmBaseDados.dbBaseDados.Commit;

  //Ewerton Beltramini SIG88487 - Criação da mensagem abaixo.
  MessageDlg('Alteração realizada com sucesso!',mtInformation,[mbOk],0);

end;

procedure TfrmAlteraBeneficio.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if dtmBaseDados.dbBaseDados.InTransaction
  then dtmBaseDados.dbBaseDados.Rollback;

end;

procedure TfrmAlteraBeneficio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if dtmBaseDados.dbBaseDados.InTransaction
  then dtmBaseDados.dbBaseDados.Rollback;

  inherited;

end;

procedure TfrmAlteraBeneficio.bbtnOkDetClick(Sender: TObject);
begin
  inherited;
  if not dtmBaseDados.dbBaseDados.InTransaction
  then dtmBaseDados.dbBaseDados.StartTransaction;

  GravaLogTotalPrev('Alt.Benef.-Matr.:' +qry.FieldByName('MATRICULA').AsString+
                           '-Proc.:'           +qry.FieldByName('NUMEROPROCESSO').AsString+
                           '-Pessoa:'          +qryDet.FieldByName('IDPESSOA').AsString+
                           '-Benef.:'          +qryDet.FieldByName('IDBENEFICIO').AsString+
                           '-N.INSS Antes:'    +qryDet.FieldByName('NUMPROCINSS_ANTES').AsString+
                           '-N.INSS Depois:'   +qryDet.FieldByName('NUMPROCINSS').AsString);
end;

procedure TfrmAlteraBeneficio.BtMatriculaClick(Sender: TObject);
Var
  sSQLValues, sMatriculaNova : String;
begin
  inherited;

  If (Not qryDet.FieldByName('MATRICULA').IsNull) Then Begin
    if MsgDlg('Já existe uma matricula para este beneficiário. Realmente deseja gerar uma nova? ',
              'Atenção',mtWarning,[mbyes,mbno],0) = mrNo
    then Exit;
  End;

  //Ewerton Beltramini SIG88487 - Comentario do codigo abaixo.
  (*
  if (qryDet.fieldbyname('FLGPECULIO').AsInteger <> 1) and
     (qryDet.fieldbyname('FLGRESGATE').AsInteger <> 1) and
     (qryDet.State in [dsEdit]) and
     (Trim(prmMASCMATPENS) <> '')
  then begin

     If Trim(dbeMatriculaBenef.Text) = '' Then
     Begin
       sMatriculaNova := GeraMatricula(QryAux, 0);
       qryDet.Edit;
       sSQLValues := 'UPDATE DEPENTIT SET MATRICULA = '+QuotedStr(sMatriculaNova)+' '+
                     'WHERE IDTITULAR = '+qryDet.ParamByname('IDTITULAR').AsString+
                     '      AND IDPESSOA = '+qryDet.FieldByName('IDPESSOA').AsString;
       ExecutarQuery(QryAux, sSQLValues);
       QryDet.FieldByName('MATRICULA').AsString := sMatriculaNova;
     End;
  end;
  *)
end;



procedure TfrmAlteraBeneficio.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  //Ewerton Beltramini SIG88487 - Comentario do codigo abaixo.
(*
  GrBxInfBenef.Visible := True;
  If qryDet.ParamByname('IDTITULAR').AsString = qryDet.FieldByName('IDPESSOA').AsString
  Then Begin
    GrBxInfBenef.Visible := False;
  End;
*)
end;



procedure TfrmAlteraBeneficio.sbtnAltDetClick(Sender: TObject);
begin
  inherited;

  //edilaine SIG118528 : inicio
  pnlINSS.visible  := (qryDet.FieldByName('FONTEPAGADORA').AsInteger = 2);
  reVlrSRB.visible := (qryDet.FieldByName('FONTEPAGADORA').AsInteger = 1);
  lblSRB.visible   := (qryDet.FieldByName('FONTEPAGADORA').AsInteger = 1);

  reVlrBenefAnt.text := qryDet.FieldByName('VALORBENEFANT').AsString;
  reVlrBenefIni.text := qryDet.FieldByName('VALORNADIB').AsString;
  reVlrSRB.text      := qryDet.FieldByName('VALORSRB').AsString;
  reVlrInfoINSS.text := qryDet.FieldByName('VLRINFINSS').AsString;

  //Ewerton Beltramini SIG88487 - Criação do bloco abaixo.
  {if (qryDetFONTEPAGADORA.AsInteger = 1) then
  begin
        Label17.Visible     := False;
        DBEdit16.Visible    := False;
        Label18.Visible     := False;
        DBEdit17.Visible    := False;
        Label19.Visible     := False;
        DBEdit18.Visible    := False;
        Label15.Visible     := False;
        DBEdit14.Visible    := False;
        Label16.Visible     := False;
        DBEdit15.Visible    := False;
        DBCheckBox1.Visible := False;
        DBCheckBox2.Visible := False;
        Label20.Visible     := False;
        Bevel1.Visible      := False;
        Shape1.Visible      := False;
        Shape2.Visible      := False;

  end
  else if (qryDetFONTEPAGADORA.AsInteger = 2) then
  begin
        Label17.Visible     := True;
        DBEdit16.Visible    := True;
        Label18.Visible     := True;
        DBEdit17.Visible    := True;
        Label19.Visible     := True;
        DBEdit18.Visible    := True;
        Label15.Visible     := True;
        DBEdit14.Visible    := True;
        Label16.Visible     := True;
        DBEdit15.Visible    := True;
        DBCheckBox1.Visible := True;
        DBCheckBox2.Visible := True;
        Label20.Visible     := True;
        Bevel1.Visible      := True;
        Shape1.Visible      := True;
        Shape2.Visible      := True;

  end;
  }//edilaine SIG118528 : fim

  //Ewerton Beltramini SIG88487 - Criação do codigo abaixo.
  lblValBase1.Caption  := qryDet.FieldByName('NOMEVALORBASE1').AsString;
  lblValBase2.Caption  := qryDet.FieldByName('NOMEVALORBASE2').AsString;
  lblValBase3.Caption  := qryDet.FieldByName('NOMEVALORBASE3').AsString;

end;

procedure TfrmAlteraBeneficio.qryDetAfterScroll(DataSet: TDataSet);
begin
  inherited;
    //Ewerton Beltramini SIG88487 - Alteração dos espaços entre as variaveis.
  edPaiDetalhe.Text := qryDet.FieldByName('NOMEDEPENDENTE').AsString + ' - ' + qryDet.FieldByName('BENEFICIO').AsString;
end;

procedure TfrmAlteraBeneficio.qryDetBeforePost(DataSet: TDataSet);
begin
   // Fernando xavier  141073/3661  KINTANA 1128912
   Upd.ModifySQL.Clear;
   if qry.state in [DsEdit] then
      qry.CancelUpdates;
   // fernando Xavier  141073/3661  KINTANA 1128912
  if not qryDet.Active then Exit;  

  //edilaine SIG118528 : inicio
  qryDet.FieldByName('VALORBENEFANT').AsString := reVlrBenefAnt.text;
  qryDet.FieldByName('VALORNADIB').AsString    := reVlrBenefIni.text;
  qryDet.FieldByName('VALORSRB').AsString      := reVlrSRB.text;
  qryDet.FieldByName('VLRINFINSS').AsString    := reVlrInfoINSS.text; 
  //edilaine SIG118528 : FIM


  inherited;

  //Ewerton Beltramini SIG88487 - Criação do codigo abaixo.
  //Inicializando e carregando variaveis de controle...
   // fValorBase1 := 0;  --SIG 97910
   // fValorBase2 := 0;  --SIG 97910
   // fValorBase3 := 0;  --SIG 97910

  fValorBase1 := -1;  //SIG 97910
  fValorBase2 := -1;  //SIG 97910
  fValorBase3 := -1;  //SIG 97910

 //Inicio SIG 95504 
 // if  (qryDetVALORBASE1.OldValue <> qryDetVALORBASE1.NewValue) or
 //     (qryDetVALORBASE2.OldValue <> qryDetVALORBASE2.NewValue) or
 //     (qryDetVALORBASE3.OldValue <> qryDetVALORBASE3.NewValue) then
 // begin
 //      fValorBase1 := qryDetVALORBASE1.NewValue;
 //      fValorBase2 := qryDetVALORBASE2.NewValue;
 //      fValorBase3 := qryDetVALORBASE3.NewValue;
 // end;

  if  (qryDet.FieldByName('VALORBASE1').OldValue <> qryDet.FieldByName('VALORBASE1').NewValue) then
               fValorBase1 := qryDet.FieldByName('VALORBASE1').NewValue;
  if  (qryDet.FieldByName('VALORBASE2').OldValue <> qryDet.FieldByName('VALORBASE2').NewValue)  then
               fValorBase2 := qryDet.FieldByName('VALORBASE2').NewValue;
  if  (qryDet.FieldByName('VALORBASE3').OldValue <> qryDet.FieldByName('VALORBASE3').NewValue)  then
               fValorBase3 := qryDet.FieldByName('VALORBASE3').NewValue;
//Fim SIG 95504

  //Ewerton Beltramini SIG88487 - Comentario do codigo abaixo.
  (*
  if Trim(dblkpcmbPortForma.Text) <> ''
  then qryDet.FieldByName('DESCFORMA').AsString := qryPortForma.FieldByName('DESCRICAO').AsString
  else qryDet.FieldByName('DESCFORMA').AsString := '';

  if Trim(dblkpcmbAgencia.Text) <> ''
  then qryDet.FieldByName('AGENCIACREDITO').AsString := qryAgenciaResgate.FieldByName('NUMBANCO').AsString+'/Ag.'+qryAgenciaResgate.FieldByName('NUMAGENCIA').AsString
  else qryDet.FieldByName('AGENCIACREDITO').AsString := '';
 *)

 end;


//edilaine SIG118528 : inicio
{procedure TfrmAlteraBeneficio.qryDetDATAREQUERIMENTOSetText(Sender: TField;
  const Text: String);
begin
     //Ewerton Beltramini SIG88487 - Criado codigo abaixo.
     if not ( CheckDate(Sender,Text) ) then Abort;
end;

procedure TfrmAlteraBeneficio.qryDetDATAINICIOFUNDSetText(Sender: TField;
  const Text: String);
begin
  inherited;
     //Ewerton Beltramini SIG88487 - Criado codigo abaixo.
     if not ( CheckDate(Sender,Text) ) then Abort;
end;

procedure TfrmAlteraBeneficio.qryDetDATAFINALSetText(Sender: TField;
  const Text: String);
begin
  inherited;
     //Ewerton Beltramini SIG88487 - Criado codigo abaixo.
     if not ( CheckDate(Sender,Text) ) then Abort;
end;

procedure TfrmAlteraBeneficio.qryDetDATAINICIOSetText(Sender: TField;
  const Text: String);
begin
  inherited;
     //Ewerton Beltramini SIG88487 - Criado codigo abaixo.
     if not ( CheckDate(Sender,Text) ) then Abort;
end;

procedure TfrmAlteraBeneficio.qryDetDIBBENEFANTSetText(Sender: TField;
  const Text: String);
begin
  inherited;
     //Ewerton Beltramini SIG88487 - Criado codigo abaixo.
     if not ( CheckDate(Sender,Text) ) then Abort;
end;

procedure TfrmAlteraBeneficio.qryDetDATAENCERRAMENTOSetText(Sender: TField;
  const Text: String);
begin
  inherited;
     //Ewerton Beltramini SIG88487 - Criado codigo abaixo.
     if not ( CheckDate(Sender,Text) ) then Abort;
end; }

procedure TfrmAlteraBeneficio.reVlrBenefAntKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Not (Key in (['0'..'9',',',#8])) Then Key := #0;
end;

procedure TfrmAlteraBeneficio.reVlrBenefIniKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Not (Key in (['0'..'9',',',#8])) Then Key := #0;
end;

procedure TfrmAlteraBeneficio.reVlrSRBKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Not (Key in (['0'..'9',',',#8])) Then Key := #0;
end;

procedure TfrmAlteraBeneficio.reVlrInfoINSSKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Not (Key in (['0'..'9',',',#8])) Then Key := #0;
end;

end.
