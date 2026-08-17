{ Alterações
//***************************************************************************************
//No. ATENDER........: WO13994
//Data da Alteração..: 30/08/2024
//Alteração Form.....: FCadInformeMT
//Responsável........: Arnaldo Vicente Scarin
//Descrição..........: Ajustes no Componente dbrgDirf, onde ocorreu a inclusão de mais 2
//                     Opções - Alteração no DFM.
//***************************************************************************************
//N. SIG.............: 74355
//Data da Alteração..: 15/01/2019
//Alteração Form.....: FCadInformeMT
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Inclusão de novos tipos de linhas para DIRF.
//***************************************************************************************
Analista.: Darivaldo Alencar
Data.....: 19/12/2016
Sol......: 28407
Rotina...: -
Descrição: Inclusão do item 47,alteração somente no dfm
**********************************************************************
Analista.: Paulo Nobre
Data.....: 30/12/2015
Sol......: 257831/18009
PPM......: 1207646
Rotina...: -
Descrição: Inclusão dos items 45 e 46, alteração somente no dfm
**********************************************************************
Analista.: Paulo Nobre e Felipe A. Santos
Data.....: 19/02/2015
Sol......: 248824/16980
PPM......: 680604
Rotina...: -
Descrição: Inclusão do item 44, alteração somente no dfm
**********************************************************************
Analista.: Paulo Nobre e Felipe A. Santos
Data.....: 09/01/2015
Sol......: 243508/16869
PPM......: 630406
Rotina...: -
Descrição: Inclusão do Item 43
**********************************************************************
Analista.: Edilaine Ferraresi
SOL......: 180961
Kintana..: 1677063
Data.....: 29/05/2012
Rotina...: CmeCadastroApplyEdit
Descrição: refazer a pesquisa após alteração do ano de vigência do informe
**********************************************************************
Analista.: Vinicius Eduardo Nascimento Maciel
Pendencia: SOL 170987 KTN 1528710
Data.....: 20/01/2012
Rotina...: tela
Descrição: abaixo
Dfm......: Foram alteradas as propriedades: Items e Values(dbrgDirf) foram
           adicionados seis novos itens.
**********************************************************************
Analista.: Vinicius Eduardo Nascimento Maciel
Pendencia: SOL 168331 / KTN 1482898
Data.....: 05/01/2012
Rotina...: CmeCadastro
Descrição: Foi adicionado um campo Ano Vigencia na tabela informe
Dfm......: Foram adicionados os componentes: spedAnoVigencia e lbAnoVigencia.
           Foram alteradas as propriedades MaxLength(dbedCodInforme) para 4.
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 27159
Data.....: 03/01/2008
Rotina...: Tela
Descrição: Acrescentar novos códigos da Dirf.
**********************************************************************
Analista.: Paulo Ramos
Pendencia: 21142
Data.....: 23/06/2006
Rotina...: GeraFolha
Descrição: Alteração do label do componente dbckRendimentoBruto.
**********************************************************************}
Unit FCadInformeMT;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet, uCtrlInforme,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, DBCtrls,
  Wwdbspin, //Vinicius Maciel -  SOL 168331 - KTN 1482898
  Mask, wwdbedit, {$IFDEF VERSAO0505}uComum{$ELSE}uCMTypes{$ENDIF};

Type
  TfrmCadInformeMT = Class(TFrmCadastroMT)
    lblNome: TLabel;
    dbedNome: TwwDBEdit;
    Label1: TLabel;
    dbedCodInforme: TwwDBEdit;
    dbrgNatureza: TDBRadioGroup;
    dbckRendimentoBruto: TDBCheckBox;
    dbckIRRF: TDBCheckBox;
    dbrgDirf: TDBRadioGroup;
    Label3: TLabel;
    lbAnoVigencia: TLabel;
    spedAnoVigencia: TwwDBSpinEdit;
    DBCheckBox1: TDBCheckBox;
    Procedure dbckRendimentoBrutoClick(Sender: TObject);
    Procedure dbckIRRFClick(Sender: TObject);
    Procedure bbtnConfirmarClick(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
    Procedure CmeCadastroApplyDelete(sender: TObject; Var Accept: Boolean);
    Procedure CmeCadastroApplyEdit(sender: TObject; Var Accept: Boolean);
    Procedure CmeCadastroApplyInsert(sender: TObject; Var Accept: Boolean);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure bbtnCancelarClick(Sender: TObject);
    Procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
    Procedure CmeCadastroAtualizaBotoes(Sender: TObject);
  Private
    Informe: TCtrlInforme;
  Public
    { Public declarations }
  End;

Var
  frmCadInformeMT: TfrmCadInformeMT;

Implementation

Uses USistema, UMensErro, UDatabase, DBaseDados;
{$R *.DFM}

Procedure TfrmCadInformeMT.dbckRendimentoBrutoClick(Sender: TObject);
Begin
  Inherited;
  If cds.State In [dsInsert, dsEdit] Then Begin
      If dbckRendimentoBruto.Checked Then Begin
          cds.FieldByName('FLGIRRF').AsString := 'N';
          If (cds.FieldByName('CODDIRF').AsInteger <> 2) And
            (cds.FieldByName('CODDIRF').AsInteger <> 5) Then
            cds.FieldByName('CODDIRF').AsInteger := 2;
          If cds.FieldByName('FLGNATUREZA').isNull Then
            cds.FieldByName('FLGNATUREZA').AsString := 'P';
          dbckIRRF.Enabled := False;
        End Else Begin
          cds.FieldByName('CODDIRF').AsInteger := 1;
          dbckIRRF.Enabled := True;
        End;
    End;
End;

Procedure TfrmCadInformeMT.dbckIRRFClick(Sender: TObject);
Begin
  Inherited;
  If cds.State In [dsInsert, dsEdit] Then Begin
      If dbckIRRF.Checked Then Begin
          cds.FieldByName('FLGBASE').AsString := 'N';
          If (cds.FieldByName('CODDIRF').AsInteger <> 3) And
            (cds.FieldByName('CODDIRF').AsInteger <> 7) Then
            cds.FieldByName('CODDIRF').AsInteger := 3;
          If cds.FieldByName('FLGNATUREZA').isNull Then
            cds.FieldByName('FLGNATUREZA').AsString := 'N';
          dbckRendimentoBruto.Enabled := False;
        End Else Begin
          cds.FieldByName('CODDIRF').AsInteger := 1;
          dbckRendimentoBruto.Enabled := True;
        End;
    End;
End;

Procedure TfrmCadInformeMT.bbtnConfirmarClick(Sender: TObject);
Begin
  If trim(dbedNome.Text) = '' Then Begin
      MsgDlg('Obrigatório preencher o nome da linha para o Informe', 'Aviso', mtWarning, [mbOK], 0);
      dbedNome.SetFocus;
      exit;
    End;
  If trim(dbedCodInforme.Text) = '' Then Begin
      MsgDlg('Obrigatório escolher uma linha para o Informe', 'Aviso', mtWarning, [mbOK], 0);
      dbedCodInforme.SetFocus;
      exit;
    End;
  Inherited;
End;

Procedure TfrmCadInformeMT.FormCreate(Sender: TObject);
var
  sDia, sMes, sAno: Word;
Begin
  Inherited;
  Informe := TCtrlInforme.Create;
  Informe.Initialize(DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType, Sistema.ConnectionSide,
    Sistema.AppRemoteServer, True, Nil, Nil, False);
  cds.data := Informe.ProcurarInforme(-1);
  Informe.CdsInforme := cds;

  DecodeDate(Now, sAno, sMes, sDia);
  spedAnoVigencia.Value := sAno;
End;

Procedure TfrmCadInformeMT.CmeCadastroApplyDelete(sender: TObject;
  Var Accept: Boolean);
Begin
  Inherited;
  informe.GravarInforme;
End;

Procedure TfrmCadInformeMT.CmeCadastroApplyEdit(sender: TObject;
  Var Accept: Boolean);
Var
  lRetorno: boolean;
Begin
  Inherited;
  lRetorno := informe.GravarInforme; // Edilaine - SOL 180961 / KTN 1677063

  // Edilaine - SOL 180961 / KTN 1677063
  If (lRetorno) And (MontaSelect.ValoresChave[1] <> cds.FieldByName('ANOVIGENCIA').AsString) Then
    Begin
      cds.Data := informe.ProcurarInforme(-1);
      MontaSelect.Cancela;
    End;
  // Edilaine - SOL 180961 / KTN 1677063 - fim
End;

Procedure TfrmCadInformeMT.CmeCadastroApplyInsert(sender: TObject;
  Var Accept: Boolean);
Begin
  Inherited;
  informe.GravarInforme;
End;

Procedure TfrmCadInformeMT.CmeCadastroFind(Sender: TObject);
Begin
  Inherited;
  If MontaSelect.RetornouValor Then
    Begin
      //Vinicius Maciel -  SOL 168331 - KTN 1482898
      //cds.data :=  informe.ProcurarInforme(StrToIntDef(MontaSelect.ValoresChave[0], 0));
      cds.data := informe.ProcurarInforme(StrToIntDef(MontaSelect.ValoresChave[0], 0), MontaSelect.ValoresChave[1]);
      //Vinicius Maciel -  SOL 168331 - KTN 1482898 - FIM
      Informe.CdsInforme := cds;
    End;
End;

Procedure TfrmCadInformeMT.CmeCadastroEdit(Sender: TObject);
Begin
  Inherited;
  {Quando era efetuada uma alteração, ele altera os valores que foram carregados
  na rotina de procura. Caso seja alterado uma vez, e tente alterar de novo, o
  sistema carregava os valores da primeira procura, e não os que foram alterados}
  //Força a carregar os valores do banco.
  cds.data := informe.ProcurarInforme(StrToIntDef(MontaSelect.ValoresChave[0], 0), MontaSelect.ValoresChave[1]); //Vinicius Maciel -  SOL 168331 - KTN 1482898
  If (Cds.FieldByName('FLGBASE').AsString = 'S') Then Begin
      dbckIRRF.Enabled := False;
      dbckRendimentoBruto.Enabled := True;
    End Else Begin
      If (Cds.FieldByName('FLGIRRF').AsString = 'S') Then Begin
          dbckIRRF.Enabled := True;
          dbckRendimentoBruto.Enabled := False;
        End Else Begin
          dbckIRRF.Enabled := True;
          dbckRendimentoBruto.Enabled := True;
        End;
    End;
  dbedNome.SetFocus;
  spedAnoVigencia.Enabled := false; //Vinicius Maciel -  SOL 168331 - KTN 1482898
End;

Procedure TfrmCadInformeMT.CmeCadastroInsert(Sender: TObject);
Begin
  Inherited;
  Cds.FieldByName('FLGBASE').AsString := 'N';
  Cds.FieldByName('FLGIRRF').AsString := 'N';
  Cds.FieldByName('CODDIRF').AsInteger := 1;
  //
  dbckIRRF.Enabled := True;
  dbckRendimentoBruto.Enabled := True;
  //
  dbedNome.SetFocus;
  Cds.FieldByName('ANOVIGENCIA').AsInteger := Informe.iMaiorAnoVigencia; //Vinicius Maciel -  SOL 168331 - KTN 1482898
End;

Procedure TfrmCadInformeMT.bbtnCancelarClick(Sender: TObject);
Begin
  Inherited;
  cds.data := Informe.ProcurarInforme(-1);
End;

Procedure TfrmCadInformeMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
Begin
  Inherited;
  If OrigemAbortConfirma In [OaApplyInsert, OaApplyDelete, OaApplyEdit] Then
    MsgDlg(Informe.MessageInfo, 'Erro', MtError, [MbOk], 0);
End;

Procedure TfrmCadInformeMT.FormClose(Sender: TObject;
  Var Action: TCloseAction);
Begin
  Inherited;
  Informe.free;
End;

Procedure TfrmCadInformeMT.CmeCadastroAtualizaBotoes(Sender: TObject);
Begin
  Inherited;
  If ds.state <> dsEdit Then
    spedAnoVigencia.Enabled := true; //Vinicius Maciel -  SOL 168331 - KTN 1482898
End;

End.

