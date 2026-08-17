// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  27/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
Unit FLancaDestac;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, Mask, wwdbedit,
   Db, DBTables, Wwquery, TREdit, wwdblook, Spin, Wwtable, TB97Tlbr,
   IvDictio, IvMulti, IvEMulti, uCtrlListTerceirosRH,
   DBClient, uCMClientDataSet, uCtrlGlobalRH, uCtrlProvDesc, IniFiles;

Type
   TfrmLancaDestac = Class(TfrmOkCancelar)
      CdsRub1: TCMClientDataSet;
      CdsRub2: TCMClientDataSet;
      CdsRub3: TCMClientDataSet;
      gbxTipoOper: TGroupBox;
      dblckTipOper: TwwDBLookupCombo;
      gbxFolha: TGroupBox;
      Label5: TLabel;
      Label1: TLabel;
      Label2: TLabel;
      grpMesRef: TGroupBox;
      cmbMes: TComboBox;
      spnedAno: TSpinEdit;
      dblckRub1: TwwDBLookupCombo;
      dblckRub2: TwwDBLookupCombo;
      dblckRub3: TwwDBLookupCombo;
      CdsTipoOper: TCMClientDataSet;
      Procedure bbtnConfirmarClick(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
   Private
      { Private declarations }
      CtrlGlobalRH: TCtrlGlobalRH;
      CtrlProvDesc: TCtrlProvDesc;
      CtrlListTerceirosRH: TCtrlListTerceirosRH;
      ArqConfig: TIniFile;

      Procedure AlimentaCombos(TipoRubrica: integer = 0);
      Procedure LeAlteracoes;
      Procedure GravaAlteracoes;
   Public
      { Public declarations }
      CodRubrica: Array[1..3] Of String;
   End;

Var
   frmLancaDestac: TfrmLancaDestac;

Implementation

Uses uSistema, uMensErro, uCtrlFuncoesRH, uCtrlPadroes;

{$R *.DFM}

Procedure TfrmLancaDestac.FormCreate(Sender: TObject);
Begin
   Inherited;
   CtrlProvDesc := TCtrlProvDesc.Create;
   CtrlProvDesc.InitializeAs(Padroes);

   AlimentaCombos;

   CtrlGlobalRH := TCtrlGlobalRH.Create;
   CtrlGlobalRH.InitializeAs(Padroes);

   CtrlListTerceirosRH := TCtrlListTerceirosRH.Create('', '', '');
   CtrlListTerceirosRH.InitializeAs(Padroes);

   cmbMes.ItemIndex := FU.ExtraiMes(CtrlGlobalRH.GetNormalIni) - 1;
   spnedAno.Value := FU.ExtraiAno(CtrlGlobalRH.GetNormalIni);

   CdsTipoOper.Data := CtrlListTerceirosRH.ListTipoOperacao;

   // Carrega alterações nas opções feitas anteriormente
   LeAlteracoes;
End;

Procedure TfrmLancaDestac.AlimentaCombos(TipoRubrica: integer);
Var
   c: byte;
Begin
   // Armazena códigos das Rubricas selecionadas
   For c := 1 To 3 Do
      CodRubrica[c] := TwwDbLookupCombo(Self.FindComponent('dblckRub' + IntToStr(c))).LookupValue;

   CdsRub1.Data := CtrlProvDesc.ListRubricaEmpresa(IntToStr(Sistema.IdEmpresa));
   CdsRub2.Data := CdsRub1.Data;
   CdsRub3.Data := CdsRub1.Data;

   // Recupera códigos das Rubricas selecionadas
   For c := 1 To 3 Do
      TwwDbLookupCombo(Self.FindComponent('dblckRub' + IntToStr(c))).LookupValue := CodRubrica[c];
End;

Procedure TfrmLancaDestac.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin
   Inherited;
   FreeAndNil(CtrlProvDesc);
   FreeAndNil(CtrlGlobalRH);
   FreeAndNil(CtrlListTerceirosRH);
   GravaAlteracoes;
End;

Procedure TfrmLancaDestac.bbtnConfirmarClick(Sender: TObject);
Begin
   Inherited;
   //
End;

Procedure TfrmLancaDestac.LeAlteracoes;
Begin
   // Recupera as últimas alterações das opções
   // ArqConfig := TIniFile.Create('C:\CONFIG_FOLHAPAGTO.INI');
   ArqConfig := TIniFile.Create(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\CONFIG_FOLHAPAGTO.INI'); //Ádler Teodoro de Souza SOL 109421 KINTANA 496332

   dblckRub1.LookUpValue := ArqConfig.ReadString('LANCADESTAC', 'Rubrica1', '');
   dblckRub1.UpDate;
   dblckRub2.LookUpValue := ArqConfig.ReadString('LANCADESTAC', 'Rubrica2', '');
   dblckRub2.UpDate;
   dblckRub3.LookUpValue := ArqConfig.ReadString('LANCADESTAC', 'Rubrica3', '');
   dblckRub3.UpDate;

   dblckTipOper.LookUpValue := ArqConfig.ReadString('LANCADESTAC', 'TipOper', '');
   dblckTipOper.UpDate;
End;

Procedure TfrmLancaDestac.GravaAlteracoes;
Var
   c: byte;
Begin
   // Grava as últimas alterações das Opções
   ArqConfig.WriteString('LANCADESTAC', 'Rubrica1', dblckRub1.LookUpValue);
   ArqConfig.WriteString('LANCADESTAC', 'Rubrica2', dblckRub2.LookUpValue);
   ArqConfig.WriteString('LANCADESTAC', 'Rubrica3', dblckRub3.LookUpValue);

   ArqConfig.WriteString('LANCADESTAC', 'TipOper', dblckTipOper.LookUpValue);

   // Armazena códigos das Rubricas selecionadas
   For c := 1 To 3 Do
      CodRubrica[c] := TwwDbLookupCombo(Self.FindComponent('dblckRub' + IntToStr(c))).LookupValue;
End;

End.
