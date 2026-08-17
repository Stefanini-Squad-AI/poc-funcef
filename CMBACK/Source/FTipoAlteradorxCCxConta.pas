{*******************************************************}
{                                                       }
{ CM Soluções Informática  - CMBack50                   }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - Relacionamento entre Alterador, Centro de Custo,    }
{   Programa e Conta Contábil para contabilização do    }
{   do lançamento do alterador                          }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 09/07/2001                             }
{                                                       }
{*******************************************************}


unit FTipoAlteradorxCCxConta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, wwQuery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, CMProcuraMask,uCmTypes, Grids, Wwdbigrd, Wwdbgrid, CMProcura,
  wwdblook, CMDBLookupCombo, CmEventosCadastro, ImgList;

type
  TFrmTipoAlteradorxCCxConta = class(TfrmCadastroCS)
    CmpCContabil: TCMProcuraMaskContabil;
    CmpCentCusto: TCMProcuraMask;
    MsCentCusto: TMontaSelect;
    QryCentCusto: TwwQuery;
    QryCentCustoCODCENTROCUSTO: TStringField;
    QryCentCustoNOME: TStringField;
    QryCentCustoSTATUSGRUPOCDC: TStringField;
    QryValida: TwwQuery;
    QrySel: TwwQuery;
    QryAll: TwwQuery;
    DsSel: TwwDataSource;
    UpdSel: TUpdateSQL;
    PnlCCusto: TPanel;
    PnlTitTipoAgreAssoc: TPanel;
    GrdSel: TwwDBGrid;
    Panel2: TPanel;
    BtnSel: TSpeedButton;
    BtnSelAll: TSpeedButton;
    BtnDel: TSpeedButton;
    BtnDelAll: TSpeedButton;
    GrdAll: TwwDBGrid;
    Panel3: TPanel;
    UpdAll: TUpdateSQL;
    DsAll: TwwDataSource;
    GroupBox1: TGroupBox;
    CmbPrgAssistencial: TCMDBLookupCombo;
    QryPrograma: TwwQuery;
    QryProgramaIDPROGRAMA: TFloatField;
    QryProgramaCODPROGRAMA: TStringField;
    QryProgramaDESCPROGRAMA: TStringField;
    qryIDALTXCCXPRGXCONTA: TFloatField;
    qryCODCENTROCUSTO: TStringField;
    qryIDEMPRESA: TFloatField;
    qryIDPROGRAMA: TFloatField;
    qryPLANO: TFloatField;
    qryPLACONTA: TStringField;
    qryCODALTERADOR: TFloatField;
    qryAlt: TwwQuery;
    qryAltDESCRICAO: TStringField;
    qryAltACRESDECRES: TStringField;
    qryAltCODALTERADOR: TFloatField;
    qryAltPLACONTA: TStringField;
    qryAltCODCENTROCUSTO: TStringField;
    qryAltCONVERTE: TStringField;
    qryAltFLGCALCULAIMPOSTO: TStringField;
    GpbAlterador: TGroupBox;
    dblkAlterador: TwwDBLookupCombo;
    QryValidaIDALTXCCXPRGXCONTA: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure CmpCContabilExit(Sender: TObject);
    procedure CmpCContabilApertouBotao(Sender: TObject);
    procedure BtnSelClick(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
    procedure BtnDelAllClick(Sender: TObject);
    procedure BtnSelAllClick(Sender: TObject);
    procedure GrdSelCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure GrdAllCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure QrySelBeforePost(DataSet: TDataSet);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroCancel(Sender: TObject);
    Procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
    Function  VerificaDuplicado:Boolean;
    //Cancelamento da seleção dos registros marcados caso sejam sintéticos
    procedure DesmarcaSinteticos(Var Grd:TwwDBGrid);
  public
    { Public declarations }
  end;

var
  FrmTipoAlteradorxCCxConta: TFrmTipoAlteradorxCCxConta;

implementation

{$R *.DFM}

Uses uIntegraBack, uSistema, uDatabase, uMensErro, uFuncaoGeral, DBaseDados,
     uString, uFormManager;

Procedure TFrmTipoAlteradorxCCxConta.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  qryIDALTXCCXPRGXCONTA.AsFloat := LeultRegistro(nil,'ALTXCCXPRGXCONTA');
  qryPLANO.AsFloat := IntegraBack.Plano;
  qryIDEMPRESA.AsFloat := Sistema.IdEmpresa;

  If dblkAlterador.CanFocus Then dblkAlterador.SetFocus;
End;

Procedure TFrmTipoAlteradorxCCxConta.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  If dblkAlterador.CanFocus Then dblkAlterador.SetFocus;
End;

Procedure TFrmTipoAlteradorxCCxConta.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
  Begin
     If Qry.Active Then Qry.Close;
     If Not Qry.Prepared Then Qry.Prepare;
     Qry.ParamByName('IDALTXCCXPRGXCONTA').AsFloat := StrToFloat(MontaSelect.ValoresChave[0]);
     Qry.Open;
  End;
End;

Procedure TFrmTipoAlteradorxCCxConta.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
begin
  If (Not PnlCCusto.Visible) Then
     Accept := (dblkAlterador.Text <>  '') And
               (CmpCentCusto.Valida = VcOk) And
               (CmpCContabil.Valida = VcOk) And
               VerificaDuplicado
  Else
     Accept := True;
End;

Function TFrmTipoAlteradorxCCxConta.VerificaDuplicado:Boolean;
begin
  If QryValida.Active Then QryValida.Close;

  If (Trim(CmbPrgAssistencial.Text) = '') Then
     QryValida.Sql.Text :=
       '   SELECT  ' +
       '     IDALTXCCXPRGXCONTA ' +
       '   FROM ' +
       '     ALTXCCXPRGXCONTA ' +
       '   WHERE ' +
       '     RTRIM(CODCENTROCUSTO) = :CODCENTROCUSTO AND ' +
       '     IDEMPRESA = :IDEMPRESA AND ' +
       '     PLANO = :PLANO AND ' +
       '     RTRIM(PLACONTA) = :PLACONTA AND ' +
       '     CODALTERADOR = :CODALTERADOR AND ' +
       '     IDPROGRAMA IS NULL '
  Else
     QryValida.Sql.Text :=
       '   SELECT  ' +
       '     IDALTXCCXPRGXCONTA ' +
       '   FROM ' +
       '     ALTXCCXPRGXCONTA ' +
       '   WHERE ' +
       '     RTRIM(CODCENTROCUSTO) = :CODCENTROCUSTO AND ' +
       '     IDEMPRESA = :IDEMPRESA AND ' +
       '     PLANO = :PLANO AND ' +
       '     RTRIM(PLACONTA) = :PLACONTA AND ' +
       '     CODALTERADOR = :CODALTERADOR  AND ' +
       '     IDPROGRAMA = ' + CmbPrgAssistencial.LookupValue;

  If Not QryValida.Prepared Then QryValida.Prepare;
  QryValida.ParamByName('CODCENTROCUSTO').AsString   := Trim(qryCODCENTROCUSTO.AsString);
  QryValida.ParamByName('IDEMPRESA').AsFloat         := Sistema.IdEmpresa;
  QryValida.ParamByName('PLANO').AsFloat             := IntegraBack.Plano;
  QryValida.ParamByName('PLACONTA').AsString         := Trim(qryPLACONTA.AsString);
  QryValida.ParamByName('CODALTERADOR').AsFloat      := qryCODALTERADOR.AsFloat;
  QryValida.Open;

  Result := (QryValida.IsEmpty Or
            (QryValidaIDALTXCCXPRGXCONTA.AsFloat = qryIDALTXCCXPRGXCONTA.AsFloat));

  If Not Result Then
  Begin
     MsgDlg('Este relacionamento já foi cadastrado.','Erro',mtError,[mbOk],0);
     If dblkAlterador.Canfocus Then dblkAlterador.SetFocus;
  End;
End;


procedure TFrmTipoAlteradorxCCxConta.FormCreate(Sender: TObject);
begin
  inherited;
  PnlCCusto.Align := AlClient;

  With qryAlt Do
  Begin
     If Active Then Close;
     ParamByName('RECPAG').AsString := IntegraBack.RecPag;
     ParamByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
     Open;
  End;

  CmpCContabil.Plano := IntegraBack.Plano;
  CmpCContabil.Mascara := IntegraBack.MascaraPlano;

  CmpCentCusto.Mascara := Integraback.MascaraCC;

  If QryCentCusto.Active Then QryCentCusto.Close;
  If Not QryCentCusto.Prepared Then QryCentCusto.Prepare;

  QryCentCusto.ParamByname('IDEMPRESA').AsFloat := Sistema.IdEmpresa;

  MontaSelect.Filtro.Add('ALTXCCXPRGXCONTA.PLANO     = ' + IntToStr(IntegraBack.Plano));
  MontaSelect.Filtro.Add('TIPOALTERADOR.RECPAG    = ''' + IntegraBack.RecPag + '''');
  MontaSelect.Filtro.Add('ALTXCCXPRGXCONTA.IDEMPRESA  = ' + IntToStr(Sistema.IdEmpresa));

  MsCentCusto.Filtro.Add('CENTCUST.IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa));
end;

procedure TFrmTipoAlteradorxCCxConta.CmpCContabilExit(Sender: TObject);
begin
  inherited;
  CmpCContabil.AceitaTipoConta := SoAnalitica;
end;

procedure TFrmTipoAlteradorxCCxConta.CmpCContabilApertouBotao(Sender: TObject);
begin
  inherited;
  CmpCContabil.AceitaTipoConta := Indiferente;
end;

procedure TFrmTipoAlteradorxCCxConta.BtnSelClick(Sender: TObject);
Var
  Y:Integer;
begin
  inherited;

  DesmarcaSinteticos(GrdAll);

  For Y := 0 To GrdAll.SelectedList.count - 1 Do
  Begin
     QryAll.GotoBookmark(GrdAll.SelectedList[Y]);

     If (QryAll.FieldByName('IDALTXCCXPRGXCONTA').AsFloat = 0) Then
     Begin
        QryAll.Edit;
        QryAll.FieldByName('IDALTXCCXPRGXCONTA').AsFloat := LeultRegistro(nil,'ALTXCCXPRGXCONTA');
        QryAll.Post;
     End;
  End;

  MoveRegistros(GrdAll,GrdSel);
end;

procedure TFrmTipoAlteradorxCCxConta.BtnDelClick(Sender: TObject);
begin
  inherited;
  DesmarcaSinteticos(GrdSel);
  MoveRegistros(GrdSel,GrdAll);
end;

procedure TFrmTipoAlteradorxCCxConta.BtnDelAllClick(Sender: TObject);
begin
  inherited;
  GrdSel.SelectAll;
  BtnDel.Click;
end;

procedure TFrmTipoAlteradorxCCxConta.BtnSelAllClick(Sender: TObject);
begin
  inherited;
  GrdAll.SelectAll;
  BtnSel.Click;
end;

procedure TFrmTipoAlteradorxCCxConta.GrdSelCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  If QrySel.FieldByName('STATUSGRUPOCDC').AsString = 'S' Then
  Begin
     ABrush.Color := $00C4FFFF;
     AFont.Color := ClBlue;
  End;
end;

procedure TFrmTipoAlteradorxCCxConta.GrdAllCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  If QryAll.FieldByName('STATUSGRUPOCDC').AsString = 'S' Then
  Begin
     ABrush.Color := $00C4FFFF;
     AFont.Color := ClBlue;
  End;
end;

Procedure TFrmTipoAlteradorxCCxConta.CmeCadastroCancel(Sender: TObject);
begin
  If Not PnlCCusto.Visible Then
     inherited
  Else
     PnlCCusto.Visible := False;

  FechaQry([QrySel,QryAll],false,true);
End;

Procedure TFrmTipoAlteradorxCCxConta.CmeCadastroConfirma(Sender: TObject);
Var
   sOldPlaconta :String;
   iOldCodAlterador, iOldPlano, iOldIdEmpresa, iOldPrograma :LongInt;
   bRelacionaCC                                         :Boolean;
begin
  If Not PnlCCusto.Visible Then
  Begin
     If CmeCadastro.Operacao In [OpInserir, OpAlterar] Then
     Begin
        iOldCodAlterador := qryCODALTERADOR.AsInteger;
        sOldPlaconta     := qryPLACONTA.AsString;
        iOldPlano        := qryPLANO.AsInteger;
        iOldIdEmpresa    := qryIDEMPRESA.AsInteger;

        If (CmbPrgAssistencial.Text = '') Then
           iOldPrograma     := 0
        Else
           iOldPrograma     := StrToInt(CmbPrgAssistencial.LookupValue);

        bRelacionaCC     := True;
     End
     Else
     Begin
        sOldPlaconta     := '';
        iOldCodAlterador := 0;
        iOldPlano        := 0;
        iOldIdEmpresa    := 0;
        iOldPrograma     := 0;
        bRelacionaCC     := False;
     End;

     inherited;

     If bRelacionaCC And
        (MsgDlg('Deseja replicar o relacionamento para outros Centros de Custo ?','Confirmar',mtConfirmation, [mbYes,mbNo],0)=mryes) Then
     Begin
        PnlCCusto.Visible := True;
        If QrySel.Active Then QrySel.Close;

        //Implementado para filtrar o plano
        QrySel.Sql.Text :=
        ' SELECT ' +
        '  A.IDALTXCCXPRGXCONTA, ' +
        '  A.CODCENTROCUSTO, ' +
        '  A.CODALTERADOR, ' +
        '  A.PLANO, ' +
        '  A.PLACONTA, ' +
        '  A.IDEMPRESA, ' +
        '  A.IDPROGRAMA, ' +
        '  C.NOME, ' +
        '  C.STATUSGRUPOCDC ' +
        ' FROM ' +
        '  ALTXCCXPRGXCONTA A, CENTCUST C ' +
        ' WHERE ' +
        '  A.CODALTERADOR = :CODALTERADOR AND ' +
        '  RTRIM(A.PLANO) = :PLANO AND ' +
        '  RTRIM(A.PLACONTA) = :PLACONTA AND ' +
        FuncaoGeral.Decode(iOldPrograma,0,' A.IDPROGRAMA IS NULL AND ',' A.IDPROGRAMA = ' + IntToStr(iOldPrograma) + ' AND ') +
        '  A.IDEMPRESA = C.IDEMPRESA AND ' +
        '  A.CODCENTROCUSTO = C.CODCENTROCUSTO ' +
        ' ORDER BY ' +
        '   A.CODCENTROCUSTO, ' +
        '   C.NOME ';

        If Not QrySel.Prepared Then QrySel.Prepare;
        QrySel.ParamByName('CODALTERADOR').AsFloat  := iOldCodAlterador;
        QrySel.ParamByName('Placonta').AsString     := Trim(sOldPlaconta);
        QrySel.ParamByName('Plano').AsInteger       := iOldPlano;
        QrySel.Open;

        If QryAll.Active Then Close;
        //Inclusão do filtro TipoDocumento.RecPag na consulta de documentos
        QryAll.Sql.Text :=
        ' SELECT ' +
        '   (0) AS IDALTXCCXPRGXCONTA, ' +
        '   C.CODCENTROCUSTO, ' +
        '   ('+ IntToStr(iOldCodAlterador) + ') AS CODALTERADOR, ' +
        '   (' + IntToStr(iOldPlano) + ') AS PLANO, ' +
        '   (''' + Espaco(sOldPlaconta,18) + ''') AS PLACONTA, ' +
        '   (' + IntToStr(iOldIdEmpresa) + ') AS IDEMPRESA, ' +
        '   (' + IntToStr(iOldPrograma) + ') AS IDPROGRAMA, ' +
        '   C.NOME, ' +
        '   C.STATUSGRUPOCDC ' +
        ' FROM ' +
        '   CENTCUST C ' +
        ' WHERE ' +
        '   C.IDEMPRESA = ' + IntToStr(iOldIdEmpresa) + ' AND ' +
        '   NOT EXISTS ' +
        '       (SELECT ' +
        '         A.IDALTXCCXPRGXCONTA ' +
        '        FROM ' +
        '         ALTXCCXPRGXCONTA A ' +
        '        WHERE ' +
        '         A.CODALTERADOR = ' +  IntToStr(iOldCodAlterador) +  ' AND ' +   
        '         RTRIM(A.PLANO) = ' + IntToStr(iOldPlano) + ' AND ' +
        '         RTRIM(A.PLACONTA) = ''' + Espaco(sOldPlaconta,18) + ''' AND ' +
        FuncaoGeral.Decode(iOldPrograma,0,' A.IDPROGRAMA IS NULL AND ',' A.IDPROGRAMA = ' + IntToStr(iOldPrograma) + ' AND ') +
        '         A.IDEMPRESA = C.IDEMPRESA AND ' +
        '         A.CODCENTROCUSTO = C.CODCENTROCUSTO ) ' +
        ' ORDER BY ' +
        '   C.CODCENTROCUSTO, ' +
        '   C.NOME ';

        If Not QryAll.Prepared Then QryAll.Prepare;
        QryAll.Open;

        While PnlCCusto.Visible Do Application.ProcessMessages;
     End;
  End
  Else
  Begin
     AplicaAlteracoes([QrySel]);
     FechaQry([QrySel,QryAll],false,True);
     PnlCCusto.Visible := False;
  End;
End;

Procedure TFrmTipoAlteradorxCCxConta.DesmarcaSinteticos(Var Grd:TwwDBGrid);
 begin
  inherited;
  Grd.DataSource.DataSet.First;
  While Not Grd.DataSource.DataSet.Eof Do
  Begin
    If Grd.IsSelectedRecord And
       (Grd.DataSource.DataSet.FieldByName('STATUSGRUPOCDC').AsString = 'S') Then
       Grd.UnselectRecord;
    Grd.DataSource.DataSet.Next;
  End;
  Grd.DataSource.DataSet.First;
End;

procedure TFrmTipoAlteradorxCCxConta.QrySelBeforePost(DataSet: TDataSet);
begin
  inherited;
  If QrySel.FieldByName('IDPROGRAMA').AsInteger = 0 Then QrySel.FieldByName('IDPROGRAMA').Clear;
end;

end.


