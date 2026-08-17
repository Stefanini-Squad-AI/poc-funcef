(**
 15/05/200 - Alterações Funcef
   Inclusão da coluna de Analítico/Sintético na procura de Tipo de Desembolso/Recebimento e
   Centro de custo;
 17/05/2000 - Alterações Funcef
  Implementação da visualização das contas sintéticas na pesquisa da conta contábil
  Altereções para respeitar os novos parâmetros do sistema:
  > Vincula a Inclusão ao Relacionamento com Centro de Custo X Conta Contábil (FLGTRDXCCXCONTA)
 18/05/2000 - Alterações Funcef
  Implementação da possibilidade de replicar o relacionamento para vário centros de custo;  
**)
unit FTrdxCCxConta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, wwQuery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, CMProcuraMask,uCmTypes, Grids, Wwdbigrd, Wwdbgrid, CMProcura,
  wwdblook, CMDBLookupCombo, CmEventosCadastro, ImgList;

type
  TFrmTrdxCCxConta = class(TfrmCadastroCS)
    CmpCContabil: TCMProcuraMaskContabil;
    CmpTrd: TCMProcuraMask;
    CmpCentCusto: TCMProcuraMask;
    MsTipoDesemb: TMontaSelect;
    MsCentCusto: TMontaSelect;
    qryIDTIPORDXCCXCONTA: TFloatField;
    qryCODTIPRECDES: TStringField;
    qryRECPAG: TStringField;
    qryIDPESSOA: TFloatField;
    qryPLANO: TFloatField;
    qryPLACONTA: TStringField;
    qryCODCENTROCUSTO: TStringField;
    qryIDEMPRESA: TFloatField;
    QryTipoDesemb: TwwQuery;
    QryCentCusto: TwwQuery;
    QryTipoDesembCODTIPRECDES: TStringField;
    QryTipoDesembDESCRICAO: TStringField;
    QryTipoDesembANASINT: TStringField;
    QryCentCustoCODCENTROCUSTO: TStringField;
    QryCentCustoNOME: TStringField;
    QryCentCustoSTATUSGRUPOCDC: TStringField;
    QryValida: TwwQuery;
    QryValidaIDTIPORDXCCXCONTA: TFloatField;
    QryValidaPLACONTA: TStringField;
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
    qryIDPROGRAMA: TFloatField;
    GroupBox1: TGroupBox;
    CmbPrgAssistencial: TCMDBLookupCombo;
    QryPrograma: TwwQuery;
    QryProgramaIDPROGRAMA: TFloatField;
    QryProgramaCODPROGRAMA: TStringField;
    QryProgramaDESCPROGRAMA: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure CmpCContabilExit(Sender: TObject);
    procedure CmpCContabilApertouBotao(Sender: TObject);
    procedure FormActivate(Sender: TObject);
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
  FrmTrdxCCxConta: TFrmTrdxCCxConta;

implementation

{$R *.DFM}

Uses uIntegraBack, uSistema, uDatabase, uMensErro, uFuncaoGeral, DBaseDados,
     fCadTipoDesemb, uString, uFormManager;

Procedure TFrmTrdxCCxConta.CmeCadastroInsert(Sender: TObject);
Var
  FrmTDesemb :TForm;
begin
  inherited;
  qryIDTIPORDXCCXCONTA.AsFloat := LeultRegistro(nil,'TIPORDXCCXCONTA');
  qryRECPAG.AsString := IntegraBack.RecPag;
  qryIDPESSOA.AsFloat := Sistema.IdEmpresa;
  qryPLANO.AsFloat := IntegraBack.Plano;
  qryIDEMPRESA.AsFloat := Sistema.IdEmpresa;


  FrmTDesemb := AcharInstanciaForm(TfrmCadTipoDesemb);

  If (Not (FrmTDesemb = nil)) And
     (TfrmCadTipoDesemb(FrmTDesemb).CodTipRecDes <> '') And
     (TfrmCadTipoDesemb(FrmTDesemb).ObrigaTrdxCCxConta) Then
  Begin
     qryCODTIPRECDES.AsString := TfrmCadTipoDesemb(FrmTDesemb).CodTipRecDes;
     If CmpTrd.CanFocus Then CmpTrd.SetFocus;
     If CmpCentCusto.CanFocus Then CmpCentCusto.SetFocus;
  End
  Else
     If CmpTrd.CanFocus Then CmpTrd.SetFocus;
End;

Procedure TFrmTrdxCCxConta.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  If CmpTrd.CanFocus Then CmpTrd.SetFocus;
End;

Procedure TFrmTrdxCCxConta.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
  Begin
     If Qry.Active Then Qry.Close;
     If Not Qry.Prepared Then Qry.Prepare;
     Qry.ParamByName('IDTIPORDXCCXCONTA').AsFloat := StrToFloat(MontaSelect.ValoresChave[0]);
     Qry.Open;
  End;
End;

Procedure TFrmTrdxCCxConta.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
begin
  If (Not PnlCCusto.Visible) Then
     Accept := (CmpTrd.Valida = VcOk) And
               (CmpCentCusto.Valida = VcOk) And
               (CmpCContabil.Valida = VcOk) And
               VerificaDuplicado
  Else
     Accept := True;
End;

Function TFrmTrdxCCxConta.VerificaDuplicado:Boolean;
begin
  If QryValida.Active Then QryValida.Close;

  If (Trim(CmbPrgAssistencial.Text) = '') Then
     QryValida.Sql.Text :=
       ' SELECT ' +
       '   IDTIPORDXCCXCONTA, PLACONTA ' +
       ' FROM ' +
       '   TIPORDXCCXCONTA ' +
       ' WHERE ' +
       '   RTRIM(CODTIPRECDES) = :CODTIPRECDES AND ' +
       '   RECPAG = :RECPAG AND ' +
       '   IDPESSOA = :IDPESSOA AND ' +
       '   RTRIM(CODCENTROCUSTO) = :CODCENTROCUSTO AND ' +
       '   IDEMPRESA = :IDEMPRESA AND ' +
       '   IDPROGRAMA IS NULL '
  Else
     QryValida.Sql.Text :=
       ' SELECT ' +
       '   IDTIPORDXCCXCONTA, PLACONTA ' +
       ' FROM ' +
       '   TIPORDXCCXCONTA ' +
       ' WHERE ' +
       '   RTRIM(CODTIPRECDES) = :CODTIPRECDES AND ' +
       '   RECPAG = :RECPAG AND ' +
       '   IDPESSOA = :IDPESSOA AND ' +
       '   RTRIM(CODCENTROCUSTO) = :CODCENTROCUSTO AND ' +
       '   IDEMPRESA = :IDEMPRESA AND ' +
       '   IDPROGRAMA = ' + CmbPrgAssistencial.LookupValue;

  If Not QryValida.Prepared Then QryValida.Prepare;
  QryValida.ParamByName('CODTIPRECDES').AsString   := qryCODTIPRECDES.AsString;
  QryValida.ParamByName('RECPAG').AsString         := IntegraBack.RecPag;
  QryValida.ParamByName('IDPESSOA').AsInteger       := Sistema.IdEmpresa;
  QryValida.ParamByName('CODCENTROCUSTO').AsString := qryCODCENTROCUSTO.AsString;
  QryValida.ParamByName('IDEMPRESA').AsFloat       := Sistema.IdEmpresa;
  QryValida.Open;

  Result := (QryValida.IsEmpty Or
            (QryValidaIDTIPORDXCCXCONTA.AsFloat = QryIDTIPORDXCCXCONTA.AsFloat));

  If Not Result Then
  Begin
     MsgDlg('Este relacionamento já foi cadastrado.','Erro',mtError,[mbOk],0);
     If CmpTrd.Canfocus Then CmpTrd.SetFocus;
  End;
End;


procedure TFrmTrdxCCxConta.FormCreate(Sender: TObject);
begin
  inherited;
  CmpCContabil.Plano := IntegraBack.Plano;
  CmpCContabil.Mascara := IntegraBack.MascaraPlano;

  CmpCentCusto.Mascara := Integraback.MascaraCC;
  CmpTrd.Mascara := Integraback.MascaraRecDes;

  If QryCentCusto.Active Then QryCentCusto.Close;
  If Not QryCentCusto.Prepared Then QryCentCusto.Prepare;

  If QryTipoDesemb.Active Then QryTipoDesemb.Close;
  If Not QryTipoDesemb.Prepared Then QryTipoDesemb.Prepare;


  QryCentCusto.ParamByname('IDEMPRESA').AsFloat := Sistema.IdEmpresa;
  QryTipoDesemb.ParamByname('IDPESSOA').AsFloat := Sistema.IdEmpresa;
  QryTipoDesemb.ParamByname('RECPAG').AsString := IntegraBack.RecPag;

  MontaSelect.Filtro.Add('TIPORDXCCXCONTA.PLANO     = ' + IntToStr(IntegraBack.Plano));
  MontaSelect.Filtro.Add('TIPORDXCCXCONTA.RECPAG    = ''' + IntegraBack.RecPag + '''');
  MontaSelect.Filtro.Add('TIPORDXCCXCONTA.IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa));
  MontaSelect.Filtro.Add('TIPORDXCCXCONTA.IDPESSOA  = ' + IntToStr(Sistema.IdEmpresa));

  MsTipoDesemb.Filtro.Add('TIPORECEBDESEMB.RECPAG    = ''' + IntegraBack.RecPag + '''');
  MsTipoDesemb.Filtro.Add('TIPORECEBDESEMB.IDPESSOA  = ' + IntToStr(Sistema.IdEmpresa));

  MsCentCusto.Filtro.Add('CENTCUST.IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa));

  If (IntegraBack.RecPag = 'P') Then
     CmpTrd.Caption := 'Tipo De Desembolso'
  Else
     CmpTrd.Caption := 'Tipo De Recebimento';

  MontaSelect.Descricao[0] := CmpTrd.Caption;
  MontaSelect.Descricao[1] := 'Desc. ' + CmpTrd.Caption;

  Caption                    := CmpTrd.Caption + ' X Centro de Custo X Conta Contábil';
  CmpTrd.Mensagens.EmBranco  := CmpTrd.Caption + ' não pode estar em branco';
  CmpTrd.Mensagens.Analitica := CmpTrd.Caption + ' não pode ser analítico';
  CmpTrd.Mensagens.NaoExiste := CmpTrd.Caption + ' não existe';
  CmpTrd.Mensagens.Sintetica := CmpTrd.Caption + ' não pode ser sintético ';
end;

procedure TFrmTrdxCCxConta.CmpCContabilExit(Sender: TObject);
begin
  inherited;
  CmpCContabil.AceitaTipoConta := SoAnalitica;
end;

procedure TFrmTrdxCCxConta.CmpCContabilApertouBotao(Sender: TObject);
begin
  inherited;
  CmpCContabil.AceitaTipoConta := Indiferente;
end;

procedure TFrmTrdxCCxConta.FormActivate(Sender: TObject);
Var
  FrmTDesemb :TForm;
begin
  inherited;
  FrmTDesemb := AcharInstanciaForm(TfrmCadTipoDesemb);

  If (Not (FrmTDesemb = nil)) And
     (TfrmCadTipoDesemb(FrmTDesemb).CodTipRecDes <> '') And
     (TfrmCadTipoDesemb(FrmTDesemb).ObrigaTrdxCCxConta) Then
     sbtnInserir.Click;
end;

procedure TFrmTrdxCCxConta.BtnSelClick(Sender: TObject);
Var
  Y:Integer;
begin
  inherited;

  DesmarcaSinteticos(GrdAll);

  For Y := 0 To GrdAll.SelectedList.count - 1 Do
  Begin
     QryAll.GotoBookmark(GrdAll.SelectedList[Y]);

     If (QryAll.FieldByName('IDTIPORDXCCXCONTA').AsFloat = 0) Then
     Begin
        QryAll.Edit;
        QryAll.FieldByName('IDTIPORDXCCXCONTA').AsFloat := LeultRegistro(nil,'TIPORDXCCXCONTA');
        QryAll.Post;
     End;
  End;

  MoveRegistros(GrdAll,GrdSel);
end;

procedure TFrmTrdxCCxConta.BtnDelClick(Sender: TObject);
begin
  inherited;
  DesmarcaSinteticos(GrdSel);
  MoveRegistros(GrdSel,GrdAll);
end;

procedure TFrmTrdxCCxConta.BtnDelAllClick(Sender: TObject);
begin
  inherited;
  GrdSel.SelectAll;
  BtnDel.Click;
end;

procedure TFrmTrdxCCxConta.BtnSelAllClick(Sender: TObject);
begin
  inherited;
  GrdAll.SelectAll;
  BtnSel.Click;
end;

procedure TFrmTrdxCCxConta.GrdSelCalcCellColors(Sender: TObject;
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

procedure TFrmTrdxCCxConta.GrdAllCalcCellColors(Sender: TObject;
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

Procedure TFrmTrdxCCxConta.CmeCadastroCancel(Sender: TObject);
begin
  If Not PnlCCusto.Visible Then
     inherited
  Else
     PnlCCusto.Visible := False;

  FechaQry([QrySel,QryAll],false,true);
End;

Procedure TFrmTrdxCCxConta.CmeCadastroConfirma(Sender: TObject);
Var
   sOldCodTipRecDes, sOldPlaconta, sOldRecPag           :String;
   iOdlIdPessoa, iOldPlano, iOldIdEmpresa, iOldPrograma :LongInt;
   bRelacionaCC                                         :Boolean;
begin
  If Not PnlCCusto.Visible Then
  Begin
     If CmeCadastro.Operacao In [OpInserir, OpAlterar] Then
     Begin
        sOldCodTipRecDes := qryCODTIPRECDES.AsString;
        sOldPlaconta     := qryPLACONTA.AsString;
        sOldRecPag       := qryRECPAG.AsString;
        iOdlIdPessoa     := qryIDPESSOA.AsInteger;
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
        sOldCodTipRecDes := '';
        sOldPlaconta     := '';
        sOldRecPag       := '';
        iOdlIdPessoa     := 0;
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
        '   T.IDTIPORDXCCXCONTA, ' +
        '   T.CODCENTROCUSTO, ' +
        '   T.CODTIPRECDES, ' +
        '   T.RECPAG, ' +
        '   T.IDPESSOA, ' +
        '   T.PLANO, ' +
        '   T.PLACONTA, ' +
        '   T.IDEMPRESA, ' +
        '   T.IDPROGRAMA, ' +
        '   C.NOME, ' +
        '   C.STATUSGRUPOCDC ' +
        ' FROM ' +
        '   TIPORDXCCXCONTA T, CENTCUST C ' +
        ' WHERE ' +
        '   T.RECPAG = :RECPAG AND ' +
        '   T.IDPESSOA = :IDPESSOA AND ' +
        '   RTRIM(T.CODTIPRECDES) = :CODTIPRECDES AND ' +
        '   RTRIM(T.PLANO) = :PLANO AND ' +
        '   RTRIM(T.PLACONTA) = :PLACONTA AND ' +
        FuncaoGeral.Decode(iOldPrograma,0,' T.IDPROGRAMA IS NULL AND ',' T.IDPROGRAMA = ' + IntToStr(iOldPrograma) + ' AND ') +
        '   T.IDPESSOA = C.IDEMPRESA AND ' +
        '   T.CODCENTROCUSTO = C.CODCENTROCUSTO ' +
        ' ORDER BY ' +
        '   T.CODCENTROCUSTO, ' +
        '   C.NOME ';

        If Not QrySel.Prepared Then QrySel.Prepare;
        QrySel.ParamByName('CodTipRecDes').AsString := sOldCodTipRecDes;
        QrySel.ParamByName('Placonta').AsString     := sOldPlaconta;
        QrySel.ParamByName('RecPag').AsString       := sOldRecPag;
        QrySel.ParamByName('IdPessoa').AsInteger    := iOdlIdPessoa;
        QrySel.ParamByName('Plano').AsInteger       := iOldPlano;
        QrySel.Open;

        If QryAll.Active Then Close;
        //Inclusão do filtro TipoDocumento.RecPag na consulta de documentos
        QryAll.Sql.Text :=
        ' SELECT ' +
        '   (0) AS IDTIPORDXCCXCONTA, ' +
        '   C.CODCENTROCUSTO, ' +
        '   (''' + Espaco(sOldCodTipRecDes,15)+ ''') AS CODTIPRECDES, ' +
        '   (''' + sOldRecPag + ''') AS RECPAG, ' +
        '   (' + IntToStr(iOdlIdPessoa) + ') AS IDPESSOA, ' +
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
        '         T.IDTIPORDXCCXCONTA ' +
        '        FROM ' +
        '         TIPORDXCCXCONTA T ' +
        '        WHERE ' +
        '         T.RECPAG = ''' + sOldRecPag + ''' AND ' +
        '         T.IDPESSOA = ' + IntToStr(iOdlIdPessoa) + ' AND ' +
        '         RTRIM(T.CODTIPRECDES) = ''' + Espaco(sOldCodTipRecDes,15)+ ''' AND ' +
        '         RTRIM(T.PLANO) = ' + IntToStr(iOldPlano) + ' AND ' +
        '         RTRIM(T.PLACONTA) = ''' + Espaco(sOldPlaconta,18) + ''' AND ' +
        FuncaoGeral.Decode(iOldPrograma,0,' T.IDPROGRAMA IS NULL AND ',' T.IDPROGRAMA = ' + IntToStr(iOldPrograma) + ' AND ') +
        '         T.IDPESSOA = C.IDEMPRESA AND ' +
        '         T.CODCENTROCUSTO = C.CODCENTROCUSTO ) ' +
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

Procedure TFrmTrdxCCxConta.DesmarcaSinteticos(Var Grd:TwwDBGrid);
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

procedure TFrmTrdxCCxConta.QrySelBeforePost(DataSet: TDataSet);
begin
  inherited;
  If QrySel.FieldByName('IDPROGRAMA').AsInteger = 0 Then QrySel.FieldByName('IDPROGRAMA').Clear;
end;

end.

{
  DF 11/07 Gustavo
  Montagem de consulta para gerar arquivo de exportação dos registros cadastrados.
  Inclusão e exportação da consulta no Gerador de Relatórios;
  Fim DF 11/07 Gustavo
}
