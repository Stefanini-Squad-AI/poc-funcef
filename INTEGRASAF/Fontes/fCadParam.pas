unit fCadParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, wwdblook, CMDBLookupCombo, Mask, wwdbedit, Wwdbspin, ComCtrls, Grids, Wwdbigrd, Wwdbgrid,
  BfDialogs, BrowseFolder, uProcuraDir, CmEventosCadastro, ImgList;

Const
  DESCCAMPOEMBRANCO = ' não foi informado.';

type
  TFrmCadParam = class(TfrmCadastroCS)
    qryIDPESSOA: TFloatField;
    qryDIRARQUIVO: TStringField;
    qryDIRLOG: TStringField;
    qryINTOPER: TFloatField;
    qryCODTIPDOCP: TFloatField;
    qryCODTIPDOCR: TFloatField;
    DlgDir: TProcuraDirDlg;
    qryCOMPLDOCUMENTO: TStringField;
    qryIDTIPOCLIENTE: TFloatField;
    qryIDRAMOFORNECEDOR: TFloatField;
    PgParam: TPageControl;
    TbsGeral: TTabSheet;
    TbsPlanoPatro: TTabSheet;
    LblDirArq: TLabel;
    LblDirLog: TLabel;
    LblIntOper: TLabel;
    LblTipoDocP: TLabel;
    LblTipoDocR: TLabel;
    BtnDirArqLog: TSpeedButton;
    BtnDirArqInt: TSpeedButton;
    LblNumDoc: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    CMDBLookupCombo1: TCMDBLookupCombo;
    CMDBLookupCombo2: TCMDBLookupCombo;
    wwDBSpinEdit1: TwwDBSpinEdit;
    wwDBEdit1: TwwDBEdit;
    wwDBEdit2: TwwDBEdit;
    wwDBEdit3: TwwDBEdit;
    CMDBLookupCombo3: TCMDBLookupCombo;
    CMDBLookupCombo4: TCMDBLookupCombo;
    QryDet: TwwQuery;
    UpdDet: TUpdateSQL;
    QryDetIDPLANPATROXSAF: TFloatField;
    QryDetNUMEMPRESA: TFloatField;
    QryDetIDPLANOPREV: TFloatField;
    QryDetIDPATRO: TFloatField;
    QryDetIDPESSOA: TFloatField;
    DsDet: TwwDataSource;
    wwDBGrid1: TwwDBGrid;
    CmbPlano: TCMDBLookupCombo;
    CmbPatro: TCMDBLookupCombo;
    QryPlano: TwwQuery;
    QryPatro: TwwQuery;
    QryPlanoIDPLANOPREV: TFloatField;
    QryPlanoNOME: TStringField;
    QryPatroNOME: TStringField;
    QryPatroIDPESSOA: TFloatField;
    QryDetPATROCINADORA: TStringField;
    QryDetPLANO: TStringField;
    procedure BtnDirArqIntClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryDetAfterInsert(DataSet: TDataSet);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmbPlanoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure CmbPatroCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    Procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadParam: TFrmCadParam;

implementation

uses DIntegraSaf, uSistema, uDataBase, uMensErro, UModulo, uFuncaogeral;

{$R *.DFM}

procedure TFrmCadParam.BtnDirArqIntClick(Sender: TObject);
Var
  sDir :String;
begin
  inherited;
   DlgDir.Title := (Sender As TSpeedButton).Hint;
   If DlgDir.Execute Then
   Begin
     sDir := DlgDir.Directory;
     If (Copy(sDir,Length(sDir),1) <> '\') Then
        sDir := sDir + '\';

      Case (Sender As TSpeedButton).Tag Of
      0: qryDIRARQUIVO.AsString := sDir;
      1: qryDIRLOG.AsString := sDir;
      End;
   End;
end;

procedure TFrmCadParam.FormCreate(Sender: TObject);
begin
  inherited;
  With qry Do
  Begin
    If Active Then Close;
    Params[0].AsFloat := Sistema.IdEmpresa;
    Open;

    If IsEmpty then
    Begin
       Append;
       qryIDPESSOA.AsFloat := Sistema.IdEmpresa;
       Post;
    End;
  End;

  With QryDet Do
  Begin
     If Active Then Close;
     Params[0].AsFloat := Sistema.IdEmpresa;
     Open;
  End;

  If QryPlano.Active Then QryPlano.Close;
  QryPlano.Open;

  If QryPatro.Active Then QryPatro.Close;
  QryPatro.Open;

  If DtmIntegraSaf.QryTipoDocP.Active Then DtmIntegraSaf.QryTipoDocP.Close;
  DtmIntegraSaf.QryTipoDocP.Open;

  If DtmIntegraSaf.QryTipoDocR.Active Then DtmIntegraSaf.QryTipoDocR.Close;
  DtmIntegraSaf.QryTipoDocR.Open;

  If DtmIntegraSaf.QryTipoCLiente.Active Then DtmIntegraSaf.QryTipoCLiente.Close;
  DtmIntegraSaf.QryTipoCLiente.Open;

  If DtmIntegraSaf.QryRamoForn.Active Then DtmIntegraSaf.QryRamoForn.Close;
  DtmIntegraSaf.QryRamoForn.Open;


  sbtnAlterar.Enabled := True;
end;

Procedure TFrmCadParam.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
Begin
   Accept := False;
   If qryDIRARQUIVO.isNull Then
      MsgDlg(LblDirArq.Caption + DESCCAMPOEMBRANCO,'Atenção',mtError,[mbOk],0)
   Else
      If qryDIRLOG.isNull Then
         MsgDlg(LblDirLog.Caption + DESCCAMPOEMBRANCO,'Atenção',mtError,[mbOk],0)
      Else
         If qryINTOPER.isNull Then
            MsgDlg(LblIntOper.Caption + DESCCAMPOEMBRANCO,'Atenção',mtError,[mbOk],0)
         Else
            If qryCODTIPDOCP.isNull Then
               MsgDlg(LblTipoDocP.Caption + DESCCAMPOEMBRANCO,'Atenção',mtError,[mbOk],0)
            Else
               If qryCODTIPDOCR.isNull Then
                  MsgDlg(LblTipoDocR.Caption + DESCCAMPOEMBRANCO,'Atenção',mtError,[mbOk],0)
               Else
                  If qryCOMPLDOCUMENTO.isNull Then
                     MsgDlg(LblNumDoc.Caption + DESCCAMPOEMBRANCO,'Atenção',mtError,[mbOk],0)
                  Else
                     Accept := True;
End;

procedure TFrmCadParam.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FuncaoGeral.FechaQry([Qry,DtmIntegraSaf.QryTipoDocP,DtmIntegraSaf.QryTipoDocR, QryDet],false,true);
  Modulo.BuscaParam;
end;

procedure TFrmCadParam.QryDetAfterInsert(DataSet: TDataSet);
begin
  inherited;
  QryDetIDPLANPATROXSAF.AsFloat := LeultRegistro(nil,'PLANPATROXSAF');
  QryDetIDPESSOA.AsFloat := Sistema.IdEmpresa;
End;

procedure TFrmCadParam.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  AplicaAlteracoes([QryDet]);
end;

procedure TFrmCadParam.CmbPlanoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  QryDetIDPLANOPREV.AsFloat := QryPlanoIDPLANOPREV.AsFloat;
end;

procedure TFrmCadParam.CmbPatroCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  QryDetIDPATRO.AsFloat := QryPatroIDPESSOA.AsFloat;
end;

procedure TFrmCadParam.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  sbtnAlterar.Enabled := True;
end;

end.
