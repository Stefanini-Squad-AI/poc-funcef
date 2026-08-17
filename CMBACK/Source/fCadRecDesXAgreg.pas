(*******************************************************************************
 03/03/2000 - 2.17.13
   Implementação do Formulário
 20/03/2000 - 2.17.18
   Implementação da coluna para associação do centro de custo
 09/12/1999 - 2.20.07
   Correção na listagems de impostos: Exibia impostos duplicados ao associar ao
   tipo de desembolso/recebimento;
 17/05/2000 - Alteraç>ões Funcef
   Altereções para respeitar os novos parâmetros do sistema:
   > Vincula a Inclusão ao Relacionamento com Centro de Custo X Conta Contábil (FLGTRDXCCXCONTA)
   > Vincula a Inclusão ao Relacionamento com Centro de Custo X Impostos Agregados (FLGTRDXIMPOSTOS)
   > Vincula a Inclusão ao Relacionamento com Ramo de Fornecedor (FLGRAMOTIPOFORCLI)
 ******************************************************************************)

unit fCadRecDesXAgreg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, wwQuery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, wwdblook, CMDBLookupCombo, Grids, Wwdbigrd, Wwdbgrid,
  CmEventosCadastro, ImgList;

Const
  _SQLIMPOSTO = ' SELECT ' +
                ' T.IDTIPRECDESXAGRE, ' +
                ' T.CODTIPRECDES, ' +
                ' T.RECPAG, ' +
                ' T.IDPESSOA, ' +
                ' T.CODTIPOCUSTAGREG, ' +
                ' T.CODCENTROCUSTO, ' +
                ' T.IDEMPRESA, ' +
                ' T.IDPROGRAMA, ' +
                ' C.DESCCUSTAGREG ' +
                ' FROM ' +
                '   TIPRECDESXTIPAGRE T, ' +
                '   TIPOAGRE C ' +
                ' WHERE ' +
                '  (RTRIM(T.CODTIPRECDES) = :CODTIPRECDES) AND ' +
                '  (T.RECPAG = :RECPAG) AND ' +
                '  (T.IDPESSOA  = :IDPESSOA) AND ' +
                '  (C.CODTIPOCUSTAGREG = T.CODTIPOCUSTAGREG) ';
  _TEXTOORDERBY = ' ORDER BY C.DESCCUSTAGREG ';

type
  TfrmCadRecDesXAgreg = class(TfrmCadastroCS)
    UpdImpAgreg: TUpdateSQL;
    QryImpAgreg: TwwQuery;
    QryImpAgregDESCCUSTAGREG: TStringField;
    QryImpAgregCODTIPOCUSTAGREG: TFloatField;
    DsImpAgreg: TwwDataSource;
    PnlCadastro: TPanel;
    GrdTipoDesembAssoc: TwwDBGrid;
    PnlTitTipoAgreAssoc: TPanel;
    PblRamoForn: TPanel;
    Label1: TLabel;
    CmbTipoDesemb: TCMDBLookupCombo;
    PnlCtrls: TPanel;
    BtnIncluiDesemb: TSpeedButton;
    BtnIncluiTodosDesemb: TSpeedButton;
    BtnExcluiDesembAssoc: TSpeedButton;
    BtnExcluiAllDesembAssoc: TSpeedButton;
    PnlDesemb: TPanel;
    PnlTitDesemb: TPanel;
    GrdTipDesemb: TwwDBGrid;
    qryIDTIPRECDESXAGRE: TFloatField;
    qryCODTIPRECDES: TStringField;
    qryRECPAG: TStringField;
    qryIDPESSOA: TFloatField;
    qryCODTIPOCUSTAGREG: TFloatField;
    qryDESCCUSTAGREG: TStringField;
    qryTipoRD: TwwQuery;
    qryTipoRDCODTIPRECDES: TStringField;
    qryTipoRDDESCRICAO: TStringField;
    qryTipoRDANASINT: TStringField;
    Label2: TLabel;
    CmbCentCusto: TCMDBLookupCombo;
    QryCentCust: TwwQuery;
    QryCentCustCODCENTROCUSTO: TStringField;
    QryCentCustNOME: TStringField;
    qryCODCENTROCUSTO: TStringField;
    qryIDEMPRESA: TFloatField;
    QryCentCustSTATUSGRUPOCDC: TStringField;
    qryIDPROGRAMA: TFloatField;
    Label3: TLabel;
    CmbPrograma: TCMDBLookupCombo;
    QryPrograma: TwwQuery;
    QryProgramaIDPROGRAMA: TFloatField;
    QryProgramaCODPROGRAMA: TStringField;
    QryProgramaDESCPROGRAMA: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure BtnIncluiTodosDesembClick(Sender: TObject);
    procedure BtnExcluiAllDesembAssocClick(Sender: TObject);
    procedure BtnIncluiDesembClick(Sender: TObject);
    procedure BtnExcluiDesembAssocClick(Sender: TObject);
    procedure CmbTipoDesembCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure CmbCentCustoExit(Sender: TObject);
    procedure CmbTipoDesembExit(Sender: TObject);
    procedure CmbProgramaExit(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroAtualizaBotoes(Sender: TObject);
  private
    { Private declarations }
    procedure InsereDirEsq;
    procedure InsereEsqDir;
  public
    { Public declarations }
  end;

var
  frmCadRecDesXAgreg: TfrmCadRecDesXAgreg;

implementation

{$R *.DFM}

Uses Usistema, uIntegraBack, uDataBase, uFuncaoGeral, ustring, fCadTipoDesemb,
     uMensErro, uFormManager;

Procedure TfrmCadRecDesXAgreg.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  sbtnAlterar.Enabled := Not bbtnConfirmar.Enabled;
End;

Procedure TfrmCadRecDesXAgreg.CmeCadastroEdit(Sender: TObject);
Var
  FrmTDesemb :TForm;
begin
  inherited;
  If Qry.State in [DsEdit,DsInsert] Then Qry.Cancel;

  FrmTDesemb := AcharInstanciaForm(TfrmCadTipoDesemb);

  If (Not (FrmTDesemb = nil)) And
     (TfrmCadTipoDesemb(FrmTDesemb).CodTipRecDes <> '') And
     (TfrmCadTipoDesemb(FrmTDesemb).ObrigaTrdxImposto) Then
  Begin
     CmbTipoDesemb.LookupValue := TfrmCadTipoDesemb(FrmTDesemb).CodTipRecDes;
     CmbTipoDesembCloseUp(Self,qryTipoRD,nil,True);
  End;
End;

Procedure TfrmCadRecDesXAgreg.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
  Begin
     CmbTipoDesemb.LookupValue := MontaSelect.ValoresChave[0];
     CmbTipoDesembCloseUp(Self,qryTipoRD,nil,True);
  End;
End;

procedure TfrmCadRecDesXAgreg.InsereDirEsq;
Var
  X: Integer;
Begin
   Qry.Append;
   For X:=0 To 1 Do
       Qry.Fields[x].Value := QryImpAgreg.Fields[x].Value;
   qryIDTIPRECDESXAGRE.AsInteger := LeultRegistro(nil,'TIPRECDESXTIPAGRE');
   qryRECPAG.AsString := IntegraBack.RecPag;
   qryIDPESSOA.AsInteger := Sistema.IdEmpresa;
   qryCODTIPRECDES.AsString := Trim(CmbTipoDesemb.LookupValue);

   If CmbCentCusto.Text = '' Then
      qryCODCENTROCUSTO.Clear
   Else
      qryCODCENTROCUSTO.AsString := CmbCentCusto.LookupValue;

   qryIDEMPRESA.AsInteger := Sistema.IdEmpresa;

   If CmbPrograma.Text = '' Then
      qryIDPROGRAMA.Clear
   Else
      qryIDPROGRAMA.AsInteger := StrToIntDef(CmbPrograma.LookupValue,0);

   Qry.Post;
   QryImpAgreg.Delete;
End;

procedure TfrmCadRecDesXAgreg.InsereEsqDir;
Var
  X: Integer;
Begin
   QryImpAgreg.Append;
   For X:=0 To 1 Do
       QryImpAgreg.Fields[x].Value := Qry.Fields[x].Value;
   QryImpAgreg.Post;
   Qry.Delete;
End;


procedure TfrmCadRecDesXAgreg.FormCreate(Sender: TObject);
begin
  inherited;
  If IntegraBack.TipoEmpresa = 'P' Then
     PblRamoForn.Height := 124
  Else
     PblRamoForn.Height := 83;

  If QryImpAgreg.Active Then QryImpAgreg.Close;
  QryImpAgreg.Sql.Add(' AND (((TIPOAGRE.CODTRATFISCD = ''' + FuncaoGeral.Decode(IntegraBack.RecPag,'R','8','A') + ''') AND (TIPOALTERADOR.ACRESDECRES = ''C'')) OR ' +
                      '     ((TIPOAGRE.CODTRATFISCD = ''' + FuncaoGeral.Decode(IntegraBack.RecPag,'R','A','8') + ''') AND (TIPOALTERADOR.ACRESDECRES = ''D'')) OR ' +
                      '     (TIPOALTERADOR.ACRESDECRES IS NULL)) ORDER BY TIPOAGRE.DESCCUSTAGREG');
  QryImpAgreg.Open;

  qryTipoRDCODTIPRECDES.EditMask := IntegraBack.MascaraRecDes + ';0; ';

  MontaSelect.Filtro.Add('TIPORECEBDESEMB.RECPAG = ''' + IntegraBack.RecPag + '''');
  MontaSelect.Filtro.Add('TIPORECEBDESEMB.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));

  If qryTipoRD.Active then qryTipoRD.Close;
  qryTipoRD.ParamByname('RECPAG').AsString := IntegraBack.RecPag;
  qryTipoRD.ParamByname('IDPESSOA').AsFloat := Sistema.idEmpresa;
  qryTipoRD.Open;

  If QryCentCust.Active then QryCentCust.Close;
  QryCentCust.ParamByname('IDEMPRESA').AsFloat := Sistema.idEmpresa;
  QryCentCust.Open;
end;

procedure TfrmCadRecDesXAgreg.BtnIncluiTodosDesembClick(Sender: TObject);
begin
  inherited;
  If Not QryImpAgreg.IsEmpty Then
  Begin
    QryImpAgreg.First;
    While Not QryImpAgreg.Eof Do
          InsereDirEsq;
  End;
end;

procedure TfrmCadRecDesXAgreg.BtnExcluiAllDesembAssocClick(
  Sender: TObject);
begin
  inherited;
  If Not Qry.IsEmpty Then
  Begin
    Qry.First;
    While Not Qry.Eof Do
          InsereEsqDir;
  End;
end;

procedure TfrmCadRecDesXAgreg.BtnIncluiDesembClick(Sender: TObject);
begin
  inherited;
  If Not QryImpAgreg.IsEmpty Then InsereDirEsq;
end;

procedure TfrmCadRecDesXAgreg.BtnExcluiDesembAssocClick(Sender: TObject);
begin
  inherited;
  If Not Qry.IsEmpty Then InsereEsqDir;
end;

procedure TfrmCadRecDesXAgreg.CmbTipoDesembCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If Qry.Active       Then
  Begin
     If Qry.UpdatesPending Then
     Begin
       If Application.MessageBox('Existem alterações que não foram gravadas, grava dados ?','Atenção',
                                 Mb_IconQuestion + Mb_YesNo) = Id_Yes Then
       Begin
           AplicaAlteracoes([Qry]);
           If QryImpAgreg.UpdatesPending Then QryImpAgreg.CancelUpdates;
       End
       Else
       Begin
           If Qry.UpdatesPending          Then Qry.CancelUpdates;
           If QryImpAgreg.UpdatesPending Then QryImpAgreg.CancelUpdates;
       End;
     End;
     Qry.Close;
  End;

  If bbtnConfirmar.Enabled And
    (Trim(CmbCentCusto.Text)<>'') And
    (QryCentCustSTATUSGRUPOCDC.AsString <> 'A') Then
    Begin
       MsgDlg('Centro de custo tem de ser analítico','Atenção',mtWarning,[mbOk],0);
       If CmbCentCusto.CanFocus Then CmbCentCusto.SetFocus;
       Exit;
    End;

  If (CmbTipoDesemb.Text <> '') And (qryTipoRDANASINT.AsString = 'A') Then
  Begin
    CmbTipoDesemb.LookupValue := CmbTipoDesemb.LookupValue;
    Qry.Sql.Text := _SQLIMPOSTO;

    if trim(CmbCentCusto.text) <> '' then
       Qry.Sql.Text := Qry.Sql.Text + ' AND RTRIM(T.CODCENTROCUSTO) ='+#39+ Trim(CmbCentCusto.lookupvalue)+#39
    Else
       Qry.Sql.Text := Qry.Sql.Text + ' AND T.CODCENTROCUSTO IS NULL ';

    if trim(CmbPrograma.text) <> '' then
       Qry.Sql.Text := Qry.Sql.Text + ' AND T.IDPROGRAMA = ' + CmbPrograma.lookupvalue
    Else
       Qry.Sql.Text := Qry.Sql.Text + ' AND T.IDPROGRAMA IS NULL ';

    Qry.Sql.Text := Qry.Sql.Text + ' '  + _TEXTOORDERBY;

    If Not Qry.Prepared Then Qry.Prepare;
    Qry.ParamByname('RECPAG').AsString := IntegraBack.RecPag;
    Qry.ParamByname('IDPESSOA').AsFloat := Sistema.idEmpresa;
    Qry.ParamByname('CODTIPRECDES').AsString := Trim(CmbTipoDesemb.Lookupvalue);


    Qry.Open;

    If QryImpAgreg.Active Then QryImpAgreg.Close;

    QryImpAgreg.Sql.Text :=
        ' SELECT DISTINCT ' +
        '   TIPOAGRE.DESCCUSTAGREG, ' +
        '    TIPOAGRE.CODTIPOCUSTAGREG ' +
        ' FROM ' +
        '    TIPOAGRE, ' +
        '    TIPOALTERADOR ' +
        ' WHERE ' +
        '    ( :CODTIPRECDES <> ''0'' ) AND ' +
        '    ( TIPOAGRE.CODALTERADOR = TIPOALTERADOR.CODALTERADOR(+) ) AND ' +
        '    ( TIPOAGRE.CODTRATFISCD IN (''8'',''9'',''A'',''B'') ) AND ' +
        '    ( TIPOAGRE.CODTIPOCUSTAGREG NOT IN ' +
        '      ( SELECT ' +
        '           CODTIPOCUSTAGREG ' +
        '        FROM ' +
        '           TIPRECDESXTIPAGRE ' +
        '        WHERE ' +
        '           (RECPAG = :RECPAG) AND ' +
        '           (RTRIM(CODTIPRECDES) = :CODTIPRECDES) AND ' +
        '           (IDPESSOA = :IDPESSOA) ' +
        FuncaoGeral.Decode(trim(CmbPrograma.text),'',' AND (IDPROGRAMA IS NULL) ', ' AND (RTRIM(IDPROGRAMA) =  ' + CmbPrograma.lookupvalue + ') ') +
        FuncaoGeral.Decode(trim(CmbCentCusto.text),'',' AND (CODCENTROCUSTO IS NULL) ', ' AND (RTRIM(CODCENTROCUSTO) =  ''' + Trim(CmbCentCusto.lookupvalue) + ''') ')
        +  ')) ';



    If Not QryImpAgreg.Prepared Then QryImpAgreg.Prepare;
    QryImpAgreg.ParamByname('CODTIPRECDES').AsString := Trim(CmbTipoDesemb.Lookupvalue);
    QryImpAgreg.ParamByname('RECPAG').AsString := IntegraBack.RecPag;
    QryImpAgreg.ParamByname('IDPESSOA').AsFloat := Sistema.idEmpresa;
    QryImpAgreg.Open;
    PnlCtrls.Enabled   := True;
  End
  Else
  Begin
    PnlCtrls.Enabled   := False;
    If Qry.Active          Then Qry.Close;
    If QryImpAgreg.Active Then QryImpAgreg.Close;
    Qry.ParamByname('RECPAG').AsString := '';
    Qry.ParamByname('IDPESSOA').AsFloat := 0;
    Qry.ParamByname('CODTIPRECDES').AsString := '';
    Qry.Open;

    QryImpAgreg.Sql.Text :=
        ' SELECT DISTINCT ' +
        '   TIPOAGRE.DESCCUSTAGREG, ' +
        '    TIPOAGRE.CODTIPOCUSTAGREG ' +
        ' FROM ' +
        '    TIPOAGRE, ' +
        '    TIPOALTERADOR ' +
        ' WHERE ' +
        '    ( :CODTIPRECDES <> ''0'' ) AND ' +
        '    ( TIPOAGRE.CODALTERADOR = TIPOALTERADOR.CODALTERADOR(+) ) AND ' +
        '    ( TIPOAGRE.CODTRATFISCD IN (''8'',''9'',''A'',''B'') ) AND ' +
        '    ( TIPOAGRE.CODTIPOCUSTAGREG NOT IN ' +
        '      ( SELECT ' +
        '           CODTIPOCUSTAGREG ' +
        '        FROM ' +
        '           TIPRECDESXTIPAGRE ' +
        '        WHERE ' +
        '           (RECPAG = :RECPAG) AND ' +
        '           (RTRIM(CODTIPRECDES) = :CODTIPRECDES) AND ' +
        '           (IDPESSOA = :IDPESSOA))) ';

    QryImpAgreg.ParamByname('CODTIPRECDES').AsString := '';
    QryImpAgreg.ParamByname('RECPAG').AsString := '';
    QryImpAgreg.ParamByname('IDPESSOA').AsFloat := 0;
    QryImpAgreg.Open;
  End;
end;

procedure TfrmCadRecDesXAgreg.FormActivate(Sender: TObject);
Var
  FrmTDesemb :TForm;
begin
  inherited;
  If IntegraBack.RecPag = 'P' Then
  Begin
     Caption := 'Tipo de Desembolso x Impostos Agregados';
     Label1.Caption := 'Tipos de Desembolso';
  End
  Else
  Begin
     Caption := 'Tipo de Recebimento x Impostos Agregados';
     Label1.Caption := 'Tipos de Recebimento';
  End;

  FrmTDesemb := AcharInstanciaForm(TfrmCadTipoDesemb);

  If (Not (FrmTDesemb = nil)) And
     (TfrmCadTipoDesemb(FrmTDesemb).CodTipRecDes <> '') And
     (TfrmCadTipoDesemb(FrmTDesemb).ObrigaTrdxImposto) Then
     sbtnAlterar.Click;
end;

procedure TfrmCadRecDesXAgreg.CmbCentCustoExit(Sender: TObject);
begin
  inherited;
  If CmbCentCusto.Text = '' Then CmbTipoDesemb.CloseUp(True);
end;

procedure TfrmCadRecDesXAgreg.CmbTipoDesembExit(Sender: TObject);
begin
  inherited;
  If CmbTipoDesemb.Text = '' Then CmbTipoDesemb.CloseUp(True);
end;

procedure TfrmCadRecDesXAgreg.CmbProgramaExit(Sender: TObject);
begin
  inherited;
  If CmbPrograma.Text = '' Then CmbTipoDesemb.CloseUp(True);
end;

end.


