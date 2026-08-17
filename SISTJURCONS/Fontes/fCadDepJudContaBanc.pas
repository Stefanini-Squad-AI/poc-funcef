Unit fCadDepJudContaBanc;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fOkCancelar, Db,
   DBClient, uCMClientDataSet, StdCtrls, CheckLst, wwdblook, wwdbdatetimepicker, IvMulti,
   CMDateTimePicker, IvDictio, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls,
   BfDialogs, BrowseFolder, uProcuraDir, uCtrlListTerceirosRH,
   ColorCheckListBox, Wwdatsrc, DBCtrls, TREdit, Mask, wwdbedit, MontaSelect,
   Menus, Wwquery, DBTables,  uCmDbObject, uCmControlObject, uCtrlCustomRH;

Type
   TfrmCadDepJudContaBanc = Class(TfrmOkCancelar)
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
      qryDepConta: TwwQuery;
      Procedure FormCreate(Sender: TObject);
      Procedure FormDestroy(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure bbtnCancelarClick(Sender: TObject);
      Procedure dblkContaBancariaChange(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure spbtnProcTitularClick(Sender: TObject);
   Private
      CtrlListTerceirosRH: TCtrlListTerceirosRH;
      CodPortadorAntes, IdCBancariaAntes: variant;

   Public
      Class Function ExibirTelaContaBanc(qryDepJud: TwwQuery): boolean;
   End;

Var
   frmCadDepJudContaBanc: TfrmCadDepJudContaBanc;
   CodPortadorAntes, IdCBancariaAntes: Double;

Implementation

Uses uCMTypes, dCds, uCtrlPadroes, uCtrlFuncoesRH, uCtrlUsoGeralRH, uSistema, uMensErro, fProcuraPessoaDoc;

{$R *.DFM}


Procedure TfrmCadDepJudContaBanc.FormCreate(Sender: TObject);
Begin
   Inherited;
   CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
      CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
   CtrlListTerceirosRH.InitializeAs(Padroes);
End;

Procedure TfrmCadDepJudContaBanc.FormDestroy(Sender: TObject);
Begin
   FreeAndNil(CtrlListTerceirosRH);
   Inherited;
End;

Procedure TfrmCadDepJudContaBanc.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   Inherited;
   Action := caHide;
End;

Class Function TfrmCadDepJudContaBanc.ExibirTelaContaBanc(qryDepJud: TwwQuery): boolean;
Var
   frm: TfrmCadDepJudContaBanc;
Begin
   frm := TfrmCadDepJudContaBanc.Create(Application);
   frm.qryDepConta := qryDepJud;
   frm.dsEtapa.DataSet := qryDepJud;
   frm.CodPortadorAntes := frm.qryDepConta.FieldByName('CODPORTADOR').Value;
   frm.IdCBancariaAntes := frm.qryDepConta.FieldByName('IDCBANCARIA').Value;

   If Not frm.qryDepConta.FieldByName('CODPORTADOR').IsNull Then
      frm.CdsContaBancaria.Data := frm.CtrlListTerceirosRH.ListContaBancariaDepJud(frm.qryDepConta.FieldByName('CODPORTADOR').asFloat)
   Else
      frm.CdsContaBancaria.Data := frm.CtrlListTerceirosRH.ListContaBancariaDepJud(0);

   If Not frm.qryDepConta.FieldByName('IDCBANCARIA').IsNull Then
      frm.CdsContaBancaria3.Data := frm.CtrlListTerceirosRH.ListContaBancariaTerceiros(0, frm.qryDepConta.FieldByName('IDCBANCARIA').asFloat)
   Else
      frm.CdsContaBancaria3.Data := frm.CtrlListTerceirosRH.ListContaBancariaTerceiros(0, -1);

   Result := (frm.ShowModal = mrOk);
   frm.qryDepConta := Nil;
   frm.Free;
End;

Procedure TfrmCadDepJudContaBanc.bbtnCancelarClick(Sender: TObject);
Begin
   Inherited;
   qryDepConta.FieldByName('CODPORTADOR').Value := CodPortadorAntes;
   qryDepConta.FieldByName('IDCBANCARIA').Value := IdCBancariaAntes;
End;

Procedure TfrmCadDepJudContaBanc.dblkContaBancariaChange(Sender: TObject);
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

Procedure TfrmCadDepJudContaBanc.FormShow(Sender: TObject);
Begin
   Inherited;
   dblkContaBancariaChange(Self);
End;

Procedure TfrmCadDepJudContaBanc.spbtnProcTitularClick(Sender: TObject);
Begin
   Inherited;
   If (qryDepConta.State In [dsInsert, dsEdit]) And (frmProcuraPessoaDoc.ShowModal = mrOk) Then
      Begin
         CdsContaBancaria3.Data := CtrlListTerceirosRH.ListContaBancariaTerceiros(StrToFloat(frmProcuraPessoaDoc.sIDPessoa), 0);
         qryDepConta.FieldByName('IDCBANCARIA').Value := CdsContaBancaria3.FieldByName('IDCBANCARIA').Value;
      End;
End;

End.

