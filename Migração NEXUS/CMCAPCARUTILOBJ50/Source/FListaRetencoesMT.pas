unit FListaRetencoesMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, DBCGrids, Mask, wwdbedit, Db, Wwdatsrc,
  DBTables, Grids, Wwdbigrd, Wwdbgrid, DBClient, uCMClientDataSet, uCmSqlParams,
  uCtrlImpostoRetido, uCtrlParamIntegra,
  uCtrlLancAlteradores, uCMTypes, DBCtrls, TREdit;

type
  TFrmListaRetencoesMT = class(TfrmOkCancelar)
    DsimpAgreg: TwwDataSource;
    GrdValCalc: TwwDBGrid;
    Label1: TLabel;
    lblTotal: TLabel;
    sqlImpAgreg: TCMSqlParams;
    cdsImpAgreg: TCMClientDataSet;
    sqlAux: TCMSqlParams;
    cdsAux: TCMClientDataSet;
    cdsImpAgregHISTORICOCOMPL: TStringField;
    cdsImpAgregIDIMPOSTORETIDO: TFloatField;
    cdsImpAgregNUMLANCTO: TFloatField;
    cdsImpAgregNUMDOC: TStringField;
    cdsImpAgregCODDOCUMENTO: TFloatField;
    cdsImpAgregVALOROUTRAMOEDA: TFloatField;
    cdsImpAgregUNIDNEGOC: TFloatField;
    cdsImpAgregESTORNO: TFloatField;
    cdsImpAgregVLRLIQUIDO: TFloatField;
    cdsImpAgregVALOR: TFloatField;
    cdsImpAgregVLRRETIDO: TFloatField;
    cdsImpAgregACRESDECRES: TStringField;
    cdsImpAgregPLNCODIGO: TFloatField;
    cdsImpAgregCODALTERADOR: TFloatField;
    cdsImpAgregDATALANCTO: TDateTimeField;
    cdsImpAgregHISTORICOCOMPL_1: TStringField;
    cdsImpAgregFLGALTERARETENCAO: TStringField;
    cdsImpAgregNUMFATURA: TStringField;
    cdsImpAgregCONFIRMARETENCAO: TStringField;
    cdsImpAgregDEBCRE: TStringField;
    cdsImpAgregCODTIPDOC: TFloatField;
    cdsImpAgregDATAPROGRAMADA: TDateTimeField;
    cdsImpAgregOPERACAO: TStringField;
    cdsImpAgregIDFORCLI: TFloatField;
    cdsImpAgregDATAEMISSAO: TDateTimeField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GrdValCalcCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure GrdValCalcCalcTitleAttributes(Sender: TObject;
      AFieldName: String; AFont: TFont; ABrush: TBrush;
      var ATitleAlignment: TAlignment);

    procedure bbtnConfirmarClick(Sender: TObject);
    procedure GrdValCalcFieldChanged(Sender: TObject; Field: TField);

  private
    { Private declarations }
    _ImpostoRetido : TCtrlImpostoRetido;
    _LancAlteradores : TCtrlLancAlteradores;
    FVLRRetencao: Double;
    procedure CalculaValor;
    procedure AlteraRetencao;
    procedure SetVLRRetencao(const Value: Double);
  public
    { Public declarations }
    rValorBaixa: Double;
    ErrorMessage: String;
    constructor create(AOwner: Tcomponent; NumLancto : Integer; rValorDocumento : Double); reintroduce;
    property VLRRetencao : Double read FVLRRetencao write SetVLRRetencao;
  end;

var
  FrmListaRetencoesMT: TFrmListaRetencoesMT;

implementation

Uses uModulo, DBaseDados, uDataBase, uSistema, uFuncaoGeral;

{$R *.DFM}

procedure TFrmListaRetencoesMT.FormCreate(Sender: TObject);
begin
  inherited;
  _ImpostoRetido := TCtrlImpostoRetido.Create;
  _ImpostoRetido.Initialize(DtmBaseDados.dbBaseDados,false,Sistema.ConnectionType,Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
  _LancAlteradores := TCtrlLancAlteradores.Create;
  _LancAlteradores.Initialize(DtmBaseDados.dbBaseDados,false,Sistema.ConnectionType,Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
end;

procedure TFrmListaRetencoesMT.GrdValCalcCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  If (Field.FieldName = 'VALOR') OR
     (Field.FieldName = 'NUMFATURA') OR
     (Field.FieldName = 'CONFIRMARETENCAO')   Then
  Begin
    ABrush.Color   := $00BFFFFF;
    AFont.Color    := clBlack;
  End
  Else
    Field.ReadOnly := True;
end;

procedure TFrmListaRetencoesMT.GrdValCalcCalcTitleAttributes(Sender: TObject;
  AFieldName: String; AFont: TFont; ABrush: TBrush;
  var ATitleAlignment: TAlignment);
begin
  inherited;
  If AFieldName <> 'HISTORICOCOMPL' Then ATitleAlignment := taRightJustify;
end;

procedure TFrmListaRetencoesMT.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  If cdsImpAgreg.State In [DsEdit,DsInsert] Then cdsImpAgreg.Post;

  CalculaValor;

  Try
    FVlrRetencao := 0;

    cdsImpAgreg.DisableControls;
    cdsImpAgreg.Filtered := False;
    cdsImpAgreg.First;

    While Not cdsImpAgreg.Eof Do
    Begin
       If cdsImpAgregCONFIRMARETENCAO.AsString = 'S' Then
       Begin
          //Altera o valor da retenção do documento
          If cdsImpAgregVALOR.AsFloat <> cdsImpAgregVLRRETIDO.AsFloat Then
             AlteraRetencao;

          //Acumla valores que alteram o saldo do documento
          If Not cdsImpAgregCODALTERADOR.IsNull Then
             If ((cdsImpAgregDEBCRE.AsString = 'C') and (ParamIntegra.RecPag = 'R')) or
                ((cdsImpAgregDEBCRE.AsString = 'D') and (ParamIntegra.RecPag = 'P')) then

                FVlrRetencao := FVlrRetencao + (cdsImpAgregVALOR.AsFloat * -1)
             else
                FVlrRetencao := FVlrRetencao + cdsImpAgregVALOR.AsFloat;

          //Altera o NUMFATURA do lancto docum caso o mesmo seja informado
          If Not cdsImpAgregNUMFATURA.IsNull Then
          Begin
             If Not ExecutarQuery(DtmBaseDados.Cds,'UPDATE LANCTODOCUM SET NUMFATURA = ''' + cdsImpAgregNUMFATURA.AsString +
                                                   ''', CODTIPDOC = ' + cdsImpAgregCODTIPDOC.AsString +
                                                   ' WHERE NUMLANCTO = ' + cdsImpAgregNUMLANCTO.AsString +
                                                   ' AND CODDOCUMENTO = ' + cdsImpAgregCODDOCUMENTO.AsString ) Then
                Raise EDataBaseError.Create('Erro ao Alterar "Nº do Certificado\Documento" para o lançamento especificado');
          End;
       End
       Else
       Begin
          //Exclui Retenção Selecionada
         _ImpostoRetido.RecPag            := ParamIntegra.RecPag;
         _ImpostoRetido.IDEmpresa         := Sistema.IDEmpresa;
         _ImpostoRetido.IDUsuario         := Sistema.IDUsuario;

         _ImpostoRetido.IdEspAcesso       := Sistema.IdEspAcesso;

         _ImpostoRetido.IDModulo          := Sistema.IDModulo;
         _ImpostoRetido.IDPlanoConta      := ParamIntegra.Plano;
         _ImpostoRetido.UsaPlanoPatro     := Sistema.UsaPlanoPatro;
         _ImpostoRetido.IntegraContab     := ParamIntegra.IntegraContab;
         _ImpostoRetido.PartidaDobrada    := ParamIntegra.PartidaDobrada;
         _ImpostoRetido.DataProgramada    := cdsImpAgregDATAPROGRAMADA.AsDateTime;
         _ImpostoRetido.OperacaoDocumento := cdsImpAgregOPERACAO.AsString;
         _ImpostoRetido.IDForCli          := cdsImpAgregIDFORCLI.AsInteger;
         _ImpostoRetido.DataEmissao       := cdsImpAgregDATAEMISSAO.AsDateTime;
         _ImpostoRetido.IdImpostoRetido   := cdsImpAgregIDIMPOSTORETIDO.AsInteger;
         _ImpostoRetido.CodDocumento      := cdsImpAgregCODDOCUMENTO.AsInteger;
         _ImpostoRetido.NumLancto         := cdsImpAgregNUMLANCTO.AsInteger;
         _ImpostoRetido.ValorLancto       := cdsImpAgregVALOR.AsFloat;
         _ImpostoRetido.ValorLiquido      := cdsImpAgregVALOR.AsFloat;
         _ImpostoRetido.DebCre            := cdsImpAgregACRESDECRES.AsString;

         _ImpostoRetido.Excluir;
       End;
       cdsImpAgreg.Next;
    End;
    cdsImpAgreg.EnableControls;
    ModalResult := MrOk;
  Except
    On E:Exception do
    begin
      cdsImpAgreg.EnableControls;
      ErrorMessage := E.Message;
      ModalResult := mrAbort;
    end;
  End;
end;

procedure TFrmListaRetencoesMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  _ImpostoRetido.Free;
  _LancAlteradores.Free;
end;

procedure TFrmListaRetencoesMT.AlteraRetencao;
begin
  _ImpostoRetido.RecPag := ParamIntegra.RecPag;
  _ImpostoRetido.IDEmpresa := Sistema.IDEmpresa;
  _ImpostoRetido.IDUsuario := Sistema.IDUsuario;
  _ImpostoRetido.IDModulo  := Sistema.IDModulo;
  _ImpostoRetido.IDPlanoConta := ParamIntegra.Plano;
  _ImpostoRetido.UsaPlanoPatro := Sistema.UsaPlanoPatro;
  _ImpostoRetido.IntegraContab := ParamIntegra.IntegraContab;
  _ImpostoRetido.PartidaDobrada := ParamIntegra.PartidaDobrada;
  _ImpostoRetido.DataProgramada := cdsImpAgregDATAPROGRAMADA.AsDateTime;
  _ImpostoRetido.OperacaoDocumento := cdsImpAgregOPERACAO.AsString;
  _ImpostoRetido.IDForCli := cdsImpAgregIDFORCLI.AsInteger;
  _ImpostoRetido.DataEmissao := cdsImpAgregDATAEMISSAO.AsDateTime;

  _ImpostoRetido.IdImpostoRetido := cdsImpAgregIDIMPOSTORETIDO.AsInteger;
  _ImpostoRetido.CodDocumento    := cdsImpAgregCODDOCUMENTO.AsInteger;
  _ImpostoRetido.NumLancto       := cdsImpAgregNUMLANCTO.AsInteger;
  _ImpostoRetido.ValorLancto     := cdsImpAgregVALOR.AsFloat;
  _ImpostoRetido.ValorLiquido    := cdsImpAgregVALOR.AsFloat;
  _ImpostoRetido.DebCre          := cdsImpAgregACRESDECRES.AsString;

  if cdsImpAgregVALOR.AsFloat <> 0 then
    _ImpostoRetido.Alterar
  else
    _ImpostoRetido.Excluir;

  if Not cdsImpAgregCODALTERADOR.IsNull then
  begin
    CdsImpAgreg.Edit;
    CdsImpAgreg.FieldByName('VLRLIQUIDO').AsFloat := CdsImpAgreg.FieldByName('VALOR').AsFloat;
    CdsImpAgreg.Post;

    _LancAlteradores.CdsLancAlteradores := CdsImpAgreg ;
    if cdsImpAgregVALOR.AsFloat <> 0 then
    begin
      _LancAlteradores.ProcessaLancAlteradores(opAlterar, Sistema.IdUsuario,
               Sistema.IdEmpresa, Sistema.IdModulo, ParamIntegra.Plano, Sistema.UsaPlanoPatro,
               ParamIntegra.IntegraContab, ParamIntegra.PartidaDobrada);
    end
    else
    begin
      _LancAlteradores.ProcessaLancAlteradores(opApagar, Sistema.IdUsuario,
               Sistema.IdEmpresa, Sistema.IdModulo, ParamIntegra.Plano, Sistema.UsaPlanoPatro,
               ParamIntegra.IntegraContab, ParamIntegra.PartidaDobrada);
    end;
  end;
end;

procedure TFrmListaRetencoesMT.CalculaValor;
var
  TotVal : Double;
  Posicao : TBookMark;
begin
  TotVal  := 0;
  cdsImpAgreg.DisableControls;
  Posicao := cdsImpAgreg.GetBookmark;
  cdsImpAgreg.First;
  while not cdsImpAgreg.EOF do
  begin
    if cdsImpAgreg.FieldByName('CONFIRMARETENCAO').AsString = 'S' then
    begin
      with sqlAux do
      begin
        if cdsAux.Active then cdsAux.Close;
        Prepare;
        ParamByName('pRECPAG').AsString := ParamIntegra.RecPag;
        ParamByName('pCODALTERADOR').AsINTEGER := cdsImpAgreg.FieldByName('CODALTERADOR').AsInteger;
        Open;
      end;
      if not cdsAux.IsEmpty then begin
          if ParamIntegra.RecPag = 'R' then begin
             if cdsAux.FieldByName('ACRESDECRES').AsString = 'D' then  TotVal := TotVal + cdsImpAgreg.FieldByName('VALOR').AsFloat;
             if cdsAux.FieldByName('ACRESDECRES').AsString = 'C' then  TotVal := TotVal - cdsImpAgreg.FieldByName('VALOR').AsFloat;
          end else begin
             if cdsAux.FieldByName('ACRESDECRES').AsString = 'D' then  TotVal := TotVal - cdsImpAgreg.FieldByName('VALOR').AsFloat;
             if cdsAux.FieldByName('ACRESDECRES').AsString = 'C' then  TotVal := TotVal + cdsImpAgreg.FieldByName('VALOR').AsFloat;
          end;
      end;
    end;
    cdsImpAgreg.Next;
  end;
  cdsImpAgreg.GotoBookmark(Posicao);
  cdsImpAgreg.EnableControls;
  cdsImpAgreg.FreeBookmark(Posicao);
  TotVal := rValorBaixa + TotVal;
  lblTotal.Caption := 'R$ ' + FloatToStrF(TotVal, ffNumber,17,2);
end;


constructor TFrmListaRetencoesMT.create(AOwner: Tcomponent;
  NumLancto: Integer; rValorDocumento : Double);
begin
  inherited Create(AOwner);
  if cdsImpAgreg.Active then cdsImpAgreg.Close;
  sqlImpAgreg.Prepare;
  sqlImpAgreg.ParamByName('NUMLANCTOORIGEM').AsInteger := NumLancto;
  sqlImpAgreg.Open;

  cdsImpAgreg.Filter := 'FLGALTERARETENCAO = ''S''';
  cdsImpAgreg.Filtered := True;
  Caption := 'Valores Calculados Para o Doc. Nº ' + cdsImpAgregNUMDOC.AsString;
  rValorBaixa := rValorDocumento;
  CalculaValor;
end;

procedure TFrmListaRetencoesMT.SetVLRRetencao(const Value: Double);
begin
  FVLRRetencao := Value;
end;

procedure TFrmListaRetencoesMT.GrdValCalcFieldChanged(Sender: TObject;
  Field: TField);
begin
  inherited;
  if (Field.FieldName = 'VALOR') or (Field.FieldName = 'CONFIRMARETENCAO') then CalculaValor;
end;

end.

