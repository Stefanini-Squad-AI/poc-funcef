//********************************************************************************************************
//N. Sol..........: 171564
//N. Kintana......: 1538999
//Data............: 09/01/2012
//Responsável.....: Paulo Nobre
//Descrição.......: Inclusao de controles para mostrar as contas bancarias do escritorio de advocacia
//********************************************************************************************************
Unit fCadRegContaBanc;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fOkCancelar, Db,
   DBClient, uCMClientDataSet, StdCtrls, CheckLst, wwdblook, wwdbdatetimepicker, IvMulti,
   CMDateTimePicker, IvDictio, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls,
   BfDialogs, BrowseFolder, uProcuraDir, uCtrlListTerceirosRH,
   ColorCheckListBox, Wwdatsrc, DBCtrls, TREdit, Mask, wwdbedit, MontaSelect,
   Menus;

Type
   TfrmCadRegContaBanc = Class(TfrmOkCancelar)
      CdsEtapa: TCMClientDataSet;
      dsEtapa: TwwDataSource;
      CdsContaBancaria: TCMClientDataSet;
      DsContaBancaria: TwwDataSource;
      Label14: TLabel;
      Label8: TLabel;
      Label9: TLabel;
      dblkContaBancaria: TwwDBLookupCombo;
      dbedNumAgencia: TwwDBEdit;
      dbedConta: TwwDBEdit;
      dbedAgencia: TwwDBEdit;
      Label1: TLabel;
      dbedNumBanco: TwwDBEdit;
      dbedBanco: TwwDBEdit;
      Label2: TLabel;
      Bevel1: TBevel;
      Label3: TLabel;
      Label4: TLabel;
      Label5: TLabel;
      dbedNumAgencia3: TwwDBEdit;
      dbedConta3: TwwDBEdit;
      dbedAgencia3: TwwDBEdit;
      dbedNumBanco3: TwwDBEdit;
      dbedBanco3: TwwDBEdit;
      Label6: TLabel;
      Label7: TLabel;
      dblcTitular: TwwDBLookupCombo;
      CdsContaBancaria3: TCMClientDataSet;
      dsContaBancaria3: TwwDataSource;
      spbtnProcTitular: TBitBtn;
      DBRadioGroup1: TDBRadioGroup;
      Procedure FormCreate(Sender: TObject);
      Procedure FormDestroy(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure bbtnCancelarClick(Sender: TObject);
      Procedure dblkContaBancariaChange(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure spbtnProcTitularClick(Sender: TObject);
      Procedure bbtnConfirmarClick(Sender: TObject);
   Private
      CtrlListTerceirosRH: TCtrlListTerceirosRH;

      CodPortadorAntes, IdCBancariaAntes: variant;
   Public
      // SOL 171564 KTN 1538999 - Paulo Nobre
      Class Function ExibirTelaContaBanc(idFavorecido: Integer; CdsEtapaOrigem: TCMClientDataSet): boolean;
   End;

Var
   frmCadRegContaBanc: TfrmCadRegContaBanc;

Implementation

Uses dCds, uCtrlPadroes, uCtrlFuncoesRH, uCtrlUsoGeralRH, uSistema, uMensErro,
   fProcuraPessoaDoc;

{$R *.DFM}

Procedure TfrmCadRegContaBanc.FormCreate(Sender: TObject);
Begin
   Inherited;
   CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
      CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
   CtrlListTerceirosRH.InitializeAs(Padroes);

   CdsContaBancaria.Data := CtrlListTerceirosRH.ListContaBancaria;
End;

Procedure TfrmCadRegContaBanc.FormDestroy(Sender: TObject);
Begin
   FreeAndNil(CtrlListTerceirosRH);
   Inherited;
End;

Procedure TfrmCadRegContaBanc.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   Inherited;
   Action := caHide;
End;

Class Function TfrmCadRegContaBanc.ExibirTelaContaBanc(idFavorecido: Integer; CdsEtapaOrigem: TCMClientDataSet): boolean;
Var
   frm: TfrmCadRegContaBanc;
Begin
   frm := TfrmCadRegContaBanc.Create(Application);
   frm.CdsEtapa := CdsEtapaOrigem;
   frm.dsEtapa.DataSet := CdsEtapaOrigem;
   frm.CodPortadorAntes := frm.CdsEtapa.FieldByName('CODPORTADOR').Value;
   frm.IdCBancariaAntes := frm.CdsEtapa.FieldByName('IDCBANCARIA').Value;
   If Not frm.CdsEtapa.FieldByName('IDCBANCARIA').IsNull Then
      Begin
         frm.CdsContaBancaria3.Data :=
            frm.CtrlListTerceirosRH.ListContaBancariaTerceiros(0,
            frm.CdsEtapa.FieldByName('IDCBANCARIA').asFloat);
         frm.CdsContaBancaria3.Data :=
            frm.CtrlListTerceirosRH.ListContaBancariaTerceiros(
            frm.CdsContaBancaria3.FieldByName('IDPESSOA').asFloat, 0);
      End
   Else
      // SOL 171564 KTN 1538999 - Paulo Nobre
      frm.CdsContaBancaria3.Data := frm.CtrlListTerceirosRH.ListContaBancariaTerceiros(idFavorecido, 0);

   Result := (frm.ShowModal = mrOk);
   frm.CdsEtapa := Nil;
   frm.Free;
End;

Procedure TfrmCadRegContaBanc.bbtnCancelarClick(Sender: TObject);
Begin
   Inherited;
   CdsEtapa.FieldByName('CODPORTADOR').Value := CodPortadorAntes;
   CdsEtapa.FieldByName('IDCBANCARIA').Value := IdCBancariaAntes;
End;

Procedure TfrmCadRegContaBanc.dblkContaBancariaChange(Sender: TObject);
Begin
   Inherited;
   If dblkContaBancaria.Text = '' Then
      Begin
         dbedNumBanco.DataSource := Nil;
         dbedBanco.DataSource := Nil;
         dbedNumAgencia.DataSource := Nil;
         dbedAgencia.DataSource := Nil;
         dbedConta.DataSource := Nil;
      End
   Else
      Begin
         dbedNumBanco.DataSource := DsContaBancaria;
         dbedBanco.DataSource := DsContaBancaria;
         dbedNumAgencia.DataSource := DsContaBancaria;
         dbedAgencia.DataSource := DsContaBancaria;
         dbedConta.DataSource := DsContaBancaria;
      End;
End;

Procedure TfrmCadRegContaBanc.FormShow(Sender: TObject);
Begin
   Inherited;
   dblkContaBancariaChange(Self);
   CdsEtapa.FieldByName('IDCBANCARIA').asInteger := CdsContaBancaria3.FieldByName('IDCBANCARIA').asInteger;
End;

Procedure TfrmCadRegContaBanc.spbtnProcTitularClick(Sender: TObject);
Begin
   Inherited;
   If (CdsEtapa.State In [dsInsert, dsEdit]) And (frmProcuraPessoaDoc.ShowModal = mrOk) Then
      Begin
         CdsContaBancaria3.Data :=
            CtrlListTerceirosRH.ListContaBancariaTerceiros(StrToFloat(frmProcuraPessoaDoc.sIDPessoa), 0);
         CdsEtapa.FieldByName('IDCBANCARIA').Value := CdsContaBancaria3.FieldByName('IDCBANCARIA').Value;
      End;
End;

Procedure TfrmCadRegContaBanc.bbtnConfirmarClick(Sender: TObject);
Begin
   Inherited;
   // SOL 171564 KTN 1538999 - Paulo Nobre
   CdsEtapa.FieldByName('IDCBANCARIA').asInteger := CdsContaBancaria3.FieldByName('IDCBANCARIA').asInteger;
End;

End.

