unit FCadContrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, StdCtrls, DBCtrls, Mask, wwdbedit, IvDictio, IvMulti,
  IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, CMProcuraSubTipo, TREdit,
  ComCtrls, Grids, DBGrids, uSistema, Wwdbigrd,
  Wwdbgrid, wwdblook, wwdbdatetimepicker, CMDateTimePicker,
  CmEventosCadastro, ImgList;

type
  TfrmCadContrato = class(TfrmCadastroCS)
    PnlPrincipal: TPanel;
    Label16: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    DBNomeContrato: TwwDBEdit;
    DBCodigoContratoEmpresa: TwwDBEdit;
    DBDescricaoContrato: TDBMemo;
    pgctrlDetalhe: TPageControl;
    TabSheetDadosContratuais: TTabSheet;
    GroupBoxDatas: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label22: TLabel;
    DBDataAssinatura: TCMDateTimePicker;
    DBDataBase: TCMDateTimePicker;
    DBDataPrevistaEncerramento: TCMDateTimePicker;
    DBDataEfetivaEncerramento: TCMDateTimePicker;
    GroupBoxValores: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    DBComboMoeda: TwwDBLookupCombo;
    DBValorBaseContrato: TDBRealEdit;
    GroupBoxOutros: TGroupBox;
    Label12: TLabel;
    DBPrazoDenuncia: TwwDBEdit;
    TabSheetDadosContraparte: TTabSheet;
    dbrgTipoContrato: TDBRadioGroup;
    CMPContraparte: TCMProcuraForCli;
    DBCodAuxContrato: TDBEdit;
    Label13: TLabel;
    Label15: TLabel;
    DBLookupComboContato: TwwDBLookupCombo;
    Label29: TLabel;
    DBLookupComboTelefone: TwwDBLookupCombo;
    TabSheetEnderecos: TTabSheet;
    Label17: TLabel;
    LCEnderecoCorrespondencia: TwwDBLookupCombo;
    Label18: TLabel;
    LCEnderecoEntrega: TwwDBLookupCombo;
    Label19: TLabel;
    LComboEnderecoCobranca: TwwDBLookupCombo;
    TabSheetReservaOrcamentario: TTabSheet;
    GpDotOrc: TGroupBox;
    btnOrcamento: TSpeedButton;
    ReResOrc: TRealEdit;
    TabSheetObjetoxItem: TTabSheet;
    TabSheetIntegracao: TTabSheet;
    Label28: TLabel;
    DBcboUnidNegocio: TwwDBLookupCombo;
    Label14: TLabel;
    DBLookupResponsavel: TwwDBLookupCombo;
    Label26: TLabel;
    DBcboCentroRespon: TwwDBLookupCombo;
    Label24: TLabel;
    TabSheetTermino: TTabSheet;
    lblMultaTermino: TLabel;
    Edit1: TEdit;
    lblRegra: TLabel;
    Label25: TLabel;
    TabSheetAtraso: TTabSheet;
    lblMultaAtraso: TLabel;
    Edit2: TEdit;
    rdgrpJuros: TRadioGroup;
    lblIndiceCorrecao: TLabel;
    Edit3: TEdit;
    Label27: TLabel;
    TabSheetRenovacao: TTabSheet;
    DBRenovacao: TDBMemo;
    TabSheetObservacao: TTabSheet;
    DBObservacao: TDBMemo;
    qryLookCentroRespon: TwwQuery;
    qryLookCentroResponNOME: TStringField;
    qryLookCentroResponCODCENTRORESPON: TStringField;
    qryLookTipoDoc: TwwQuery;
    qryLookTipoDocDESCRICAO: TStringField;
    qryLookTipoDocCODTIPDOC: TFloatField;
    qryLookUnidNegocio: TwwQuery;
    qryLookUnidNegocioNOME: TStringField;
    qryLookUnidNegocioUNIDNEGOC: TFloatField;
    dsObjetoItem: TwwDataSource;
    qryTelefone: TwwQuery;
    qryObjetoContratual: TwwQuery;
    qryItemContratual: TwwQuery;
    qryObjetoItem: TwwQuery;
    qryObjetoItemIDOBJETO: TFloatField;
    qryObjetoItemIDITEM: TFloatField;
    qryObjetoItemVALORUNITARIOOBJETO: TFloatField;
    qryObjetoItemVALORTOTALOBJETO: TFloatField;
    qryObjetoItemNOMEOBJETO: TStringField;
    qryObjetoItemNOMEITEM: TStringField;
    qryObjetoItemQTDEITEM: TFloatField;
    qryMoeda: TwwQuery;
    qryContato: TwwQuery;
    qryFormaPagamento: TwwQuery;
    qryEnderecoEntrega: TwwQuery;
    qryResponsavel: TwwQuery;
    qryEnderecoCobranca: TwwQuery;
    qryEnderecoCorrespondencia: TwwQuery;
    MsResORc: TMontaSelect;
    wwDBGrid1: TwwDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    DBAviso: TwwDBEdit;
    qryIDCONTRATO: TFloatField;
    qryNOMECONTRATO: TStringField;
    qryCODPORTFORMA: TFloatField;
    qryIDENDCOBRANCA: TFloatField;
    qryCODCENTRORESPON: TStringField;
    qryIDPESSOA: TFloatField;
    qryIDENDCORRESPON: TFloatField;
    qryIDENDENTREGA: TFloatField;
    qryUNIDNEGOC: TFloatField;
    qryIDCONTATO: TFloatField;
    qryIDFORCLI: TFloatField;
    qryMOECODIGO: TFloatField;
    qryIDRESPONSAVEL: TFloatField;
    qryTIPOCONTRATO: TStringField;
    qryDATAASSINATURA: TDateTimeField;
    qryCODAUXCONTRATO: TStringField;
    qryVALORBASECONTRATO: TFloatField;
    qryDATABASECONTRATO: TDateTimeField;
    qryDATAPREVENCERRA: TDateTimeField;
    qryPRAZODENUNCIA: TFloatField;
    qryCODCONTRATOEMPR: TStringField;
    qryFLGEMPENHO: TStringField;
    qryDATAEFETENCERRA: TDateTimeField;
    qryMOTIVOENCERRA: TStringField;
    qryFLGFIMCONTRATO: TStringField;
    qryCODTIPDOC: TFloatField;
    qryRENOVACAO: TMemoField;
    qryOBSERVACAO: TMemoField;
    qryIDTELEFONE: TFloatField;
    qryIDRESERVAORCAMEN: TFloatField;
    qryAVISO: TFloatField;
    DBcboTipoDoc: TwwDBLookupCombo;
    qryContratoUsuario: TwwQuery;
    qryContratoUsuarioDel: TwwQuery;
    qryContratoOrig: TwwQuery;
    qryObjxItOrig: TwwQuery;
    qryRateioCCOrig: TwwQuery;
    qryDESCRICAOCONTRATO: TMemoField;
    qryEnderecoCobrancaIDENDERECO: TFloatField;
    qryEnderecoCobrancaENDCOBRANCA: TStringField;
    qryEnderecoEntregaIDENDERECO: TFloatField;
    qryEnderecoEntregaENDENTREGA: TStringField;
    qryEnderecoCorrespondenciaENDCORRESP: TStringField;
    qryEnderecoCorrespondenciaIDENDERECO: TFloatField;
    QryTiposProcRAD: TwwQuery;
    Label3: TLabel;
    dblcTipoProcessoRAD: TwwDBLookupCombo;
    qryIDTIPOPROCESSORAD: TFloatField;
    sbtnImagem: TToolbarButton97;
    dsImagem: TwwDataSource;
    qryImagem: TwwQuery;
    qryImagemIDIMAGEM: TFloatField;
    qryImagemIMAGEM: TBlobField;
    qryImagemDESCRIMAGEM: TStringField;
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroDelete(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroCancel(Sender: TObject);
    Procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure qryAfterInsert(DataSet: TDataSet);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dbrgTipoContratoChange(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure CMPContraparteExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnOrcamentoClick(Sender: TObject);
    procedure ReResOrcExit(Sender: TObject);
    procedure DBLookupComboContatoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbtnImagemClick(Sender: TObject);
    procedure qryAfterScroll(DataSet: TDataSet);

  private
    { Private declarations }
    procedure AssociaImagem(dsImg : TwwDataSource; pImagem : TBlobField; Campo : TFloatField; Descricao : string);
    procedure SelecionaFilhos;
    function AtualizaEnderecos(CodigoClienteFornecedor : longint): integer;
    function VerificaCamposPreenchidos: Boolean;
  public
    { Public declarations }
//    aditamento      : boolean ;
  end;

var
  frmCadContrato: TfrmCadContrato;
  idContrato: Integer;

implementation

uses {$IFDEF VERSAO0505} uComum {$ELSE} uCMTypes {$ENDIF},
  uMensErro, uDataBase, DBaseDados, UAutorizacao,fTelaAut, uOrcamento, uIntegraBack, fImagemDoc;

{$R *.DFM}

procedure TfrmCadContrato.FormCreate(Sender: TObject);
begin
   inherited;
   pgctrlDetalhe.ActivePageIndex:=0;
end;

procedure TfrmCadContrato.FormActivate(Sender: TObject);
begin
   inherited;
   MontaSelect.Filtro.Add('CONTRATOCONTR.IDCONTRATO IN (SELECT IDCONTRATO FROM CONTRATOUSUARIO '+
                          'WHERE IDUSUARIO = '+IntToStr(Sistema.IDUsuario)+')');
   //
   GpDotOrc.Enabled := (IntegraBack.IntegraOrcamento = 'S');
   OrcamentoBack := TOrcamentoBack.Create;
   If GpDotOrc.Enabled Then
      MsResORc.Filtro.Add('RESERVAORCAMEN.IDPESSOA = '+IntToStr(Sistema.IdEmpresa));
   //
   qryFormaPagamento.Close;
   qryFormaPagamento.Open;
   //
   qryResponsavel.Close;
   qryResponsavel.Open;
   //
   qryMoeda.Close;
   qryMoeda.Open;
   //
   idContrato := 0;
   qry.Close;
   qry.ParamByName('IDCONTRATO').AsFloat := idContrato;
   qry.Open;
   //
   if qry.FieldByName('IDRESERVAORCAMEN').AsInteger > 0 then
      ReResOrc.Value:=OrcamentoBack.BuscaIdNumReserva(qry.FieldByName('IDRESERVAORCAMEN').AsInteger,0,True)
   else
      ReResOrc.Value:=0;
   //
   qryObjetoItem.Close;
   qryObjetoItem.ParamByName('IDCONTRATO').AsFloat := idContrato;
   qryObjetoItem.Open;
   //
   qryLookCentroRespon.Close;
   qryLookCentroRespon.ParamByName('IDEMPRESA').AsInteger := Sistema.IdEmpresa;
   qryLookCentroRespon.Open;
   //
   qryLookUnidNegocio.Close;
   qryLookUnidNegocio.ParamByName('IDEMPRESA').AsInteger := Sistema.IdEmpresa;
   qryLookUnidNegocio.Open;
   //
   qryLookTipoDoc.Close;
   qryLookTipoDoc.ParamByName('RECPAG').AsString:='';
   qryLookTipoDoc.ParamByName('DEBCRE').AsString:='';
   qryLookTipoDoc.Open;
   //
   dblcTipoProcessoRAD.Enabled:=(Sistema.UsaRAD);
   if Sistema.UsaRAD then
    begin
       QryTiposProcRAD.Close;
       QryTiposProcRAD.Open;
    end;
end;
     
procedure TfrmCadContrato.CmeCadastroInsert(Sender: TObject);
begin
   inherited;
   ReResOrc.Value := 0;
end;

procedure TfrmCadContrato.CmeCadastroEdit(Sender: TObject);
begin
   inherited;
   If (qry.FieldByName('IdReservaOrcamen').AsInteger <> 0) Then
      Begin
        ReResOrc.Value             := OrcamentoBack.BuscaIdNumReserva(qry.FieldByName('IdReservaOrcamen').AsInteger,0,True);
        OrcamentoBack.NumReserva   := Trunc(ReResOrc.Value);
        Orcamentoback.IdReserva    := qry.FieldByName('IdReservaOrcamen').AsInteger;
        Try
           StartTransacao;
           If OrcamentoBack.EstornaReserva(OrcamentoBack.NumReserva,True) <> 0 Then Abort;
           CommitTransacao;
        Except
           Raise;
           RollBackTransacao;
        End;
      End
   Else
     Begin
        ReResOrc.Value := 0;
        OrcamentoBack.NumReserva := 0;
        OrcamentoBack.IdReserva  := 0;
     End;
end;

procedure TfrmCadContrato.CmeCadastroDelete(Sender: TObject);
begin
   { Se o Contrato já foi Encerrado ou se já foi devidamente Cadastrado, não pode ser excluído...}
   if ((qry.FieldByName('FLGFIMCONTRATO').AsString = 'S') or (qry.FieldByName('FLGFIMCONTRATO').AsString = 'E')) then
    begin
      MsgDlg('Proibida a exclusão do contrato. Cadastramento do Contrato já foi concluído.','Erro', mtError,[mbOk],0);
      Exit;
     end;
   qryContratoUsuarioDel.ParamByName('IDCONTRATO').AsInteger:=qry.FieldByName('IDCONTRATO').AsInteger;
   qryContratoUsuarioDel.ExecSQL;
   inherited;
   CmeCadastro.Confirma(Self);
end;

procedure TfrmCadContrato.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '') then
  begin
      qry.Close;
      qry.ParamByName('IDCONTRATO').AsInteger := StrToInt(trim(MontaSelect.ValoresChave[0]));
      qry.Open;
      if qry.FieldByName('IDRESERVAORCAMEN').AsInteger > 0 then
         ReResOrc.Value:=OrcamentoBack.BuscaIdNumReserva(qry.FieldByName('IDRESERVAORCAMEN').AsInteger,0,True)
      else
         ReResOrc.Value:=0;
      idContrato := qry.FieldByName('IDCONTRATO').AsInteger;
   //
      qryLookTipoDoc.Close;
      if qry.FieldByName('TIPOCONTRATO').AsString = 'A' then
       begin
          qryLookTipoDoc.ParamByName('RECPAG').AsString:='R';
          qryLookTipoDoc.ParamByName('DEBCRE').AsString:='D';
       end
      else
       begin
          qryLookTipoDoc.ParamByName('RECPAG').AsString:='P';
          qryLookTipoDoc.ParamByName('DEBCRE').AsString:='C';
       end;
      qryLookTipoDoc.Open;
      SelecionaFilhos;
  end;
end;

procedure TfrmCadContrato.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  pnlFundo.Enabled :=True;
  pgctrlDetalhe.Enabled :=True;
  if qry.State in [dsEdit,dsInsert] then
   begin
      PnlPrincipal.enabled := true;
      TabSheetDadosContratuais.enabled    := True;
      TabSheetDadosContraparte.enabled    := True;
      TabSheetEnderecos.enabled           := True;
      TabSheetIntegracao.enabled          := True;
      TabSheetReservaOrcamentario.enabled := True;
      dblcTipoProcessoRAD.Enabled         := Sistema.UsaRAD;
   end
  else
   begin
      PnlPrincipal.enabled := false;
      TabSheetDadosContratuais.enabled    := False;
      TabSheetDadosContraparte.enabled    := False;
      TabSheetEnderecos.enabled           := False;
      TabSheetIntegracao.enabled          := False;
      TabSheetReservaOrcamentario.enabled := False;
      dblcTipoProcessoRAD.Enabled         := False;
   end;
end;

procedure TfrmCadContrato.CmeCadastroCancel(Sender: TObject);
begin
   if (qry.FieldByName('IdReservaOrcamen').AsInteger <> 0) and ( qry.State = dsEdit) Then
    begin
       ReResOrc.Value := OrcamentoBack.BuscaIdNumReserva(qry.FieldByName('IdReservaOrcamen').AsInteger,0,True);
       OrcamentoBack.NumReserva   := Trunc(ReResOrc.Value);
       Orcamentoback.IdReserva    := qry.FieldByName('IdReservaOrcamen').AsInteger;
       try
          StartTransacao;
          if OrcamentoBack.MarcaReserva(OrcamentoBack.NumReserva,True) <> 0 Then Abort;
          CommitTransacao;
       except
          RollBackTransacao;
          raise;
       end;
    end;
   inherited;
end;

function TfrmCadContrato.AtualizaEnderecos(CodigoClienteFornecedor : longint): integer;
begin
   Result:=0;
   { Atualizando o Endereco de Cobrança. }
   qryEnderecoCobranca.Close;
   qryEnderecoCobranca.ParamByName('IDPESSOA').AsInteger:= CodigoClienteFornecedor;
   qryEnderecoCobranca.Open;
   //
   qryEnderecoEntrega.Close;
   qryEnderecoEntrega.ParamByName('IDPESSOA').AsInteger:= CodigoClienteFornecedor;
   qryEnderecoEntrega.Open;
   //
   qryEnderecoCorrespondencia.Close;
   qryEnderecoCorrespondencia.ParamByName('IDPESSOA').AsInteger:= CodigoClienteFornecedor;
   qryEnderecoCorrespondencia.Open;
end;

function TfrmCadContrato.VerificaCamposPreenchidos: Boolean;
begin
   VerificaCamposPreenchidos := False;
   if qry.FieldByName('NOMECONTRATO').AsString = '' then
    begin
       MsgDlg('Obrigatório preencher o nome do contrato','Atenção',mtWarning,[mbOk],0);
       if DBNomeContrato.CanFocus then DBNomeContrato.SetFocus;
       Exit;
    end;
   if qry.FieldByName('CODCONTRATOEMPR').AsString = '' then
    begin
       MsgDlg('Obrigatório preencher o código do contrato','Atenção',mtWarning,[mbOk],0);
       if DBCodigoContratoEmpresa.CanFocus then DBCodigoContratoEmpresa.SetFocus;
       Exit;
    end;
   if qry.FieldByName('DATAASSINATURA').AsString = '' then
    begin
       MsgDlg('Obrigatório preencher a data da assinatura do contrato','Atenção',mtWarning,[mbOk],0);
       pgctrlDetalhe.ActivePage := TabSheetDadosContratuais;
       if DBDataAssinatura.CanFocus then DBDataAssinatura.SetFocus;
       Exit;
    end;
   if qry.FieldByName('MOECODIGO').AsInteger = 0 then
    begin
       MsgDlg('Obrigatório preencher a moeda do contrato','Atenção',mtWarning,[mbOk],0);
       pgctrlDetalhe.ActivePage := TabSheetDadosContratuais;
       if DBComboMoeda.CanFocus then DBComboMoeda.SetFocus;
       Exit;
    end;
   if qry.FieldByName('VALORBASECONTRATO').AsFloat = 0 then
    begin
       MsgDlg('Obrigatório preencher o valor base do contrato','Atenção',mtWarning,[mbOk],0);
       pgctrlDetalhe.ActivePage := TabSheetDadosContratuais;
       if DBValorBaseContrato.CanFocus then DBValorBaseContrato.SetFocus;
       Exit;
    end;
   if trim(qry.FieldByName('UNIDNEGOC').AsString) = '' then
    begin
       MsgDlg('Obrigatório preencher Atividade / Projeto','Atenção',mtWarning,[mbOk],0);
       pgctrlDetalhe.ActivePage := TabSheetIntegracao;
       if DBcboUnidNegocio.CanFocus then DBcboUnidNegocio.SetFocus;
       Exit;
    end;
   if trim(qry.FieldByName('CODCENTRORESPON').AsString) = '' then
    begin
       MsgDlg('Obrigatório preencher o Centro de Responsabilidade','Atenção',mtWarning,[mbOk],0);
       pgctrlDetalhe.ActivePage := TabSheetIntegracao;
       if DBcboCentroRespon.CanFocus then DBcboCentroRespon.SetFocus;
       Exit;
    end;
   if trim(qry.FieldByName('CODTIPDOC').AsString) = '' then
    begin
       MsgDlg('Obrigatório preencher o Tipo de Documento','Atenção',mtWarning,[mbOk],0);
       pgctrlDetalhe.ActivePage := TabSheetIntegracao;
       if DBcboTipoDoc.CanFocus then DBcboTipoDoc.SetFocus;
       Exit;
    end;
   result := True;
end;

procedure TfrmCadContrato.SelecionaFilhos;
var
   contratoflg : char;
   stemp : string;
begin
   if qry.FieldByName('IDCONTATO').AsInteger > 0 then
    begin
       qryContato.Close;
       qryContato.parambyname('IDPESSOA').AsInteger := qry.FieldByName('IDFORCLI').AsInteger;
       qryContato.Open;
    end;
   //
   if qry.FieldByName('IDTELEFONE').AsInteger > 0 then
    begin
       qryTelefone.Close;
       qryTelefone.parambyname('IDCONTATO').AsInteger := qry.FieldByName('IDCONTATO').AsInteger;
       qryTelefone.Open;
    end;
   //
   qryObjetoItem.Close;
   qryObjetoItem.ParamByName('IDCONTRATO').AsFloat:= idContrato;
   qryObjetoItem.Open;
   //
   AtualizaEnderecos(qry.FieldByName('IDFORCLI').AsInteger);
   //
   DBValorBaseContrato.Value := qry.FieldByName('VALORBASECONTRATO').AsFloat;
   //
   if (qry.State in ([dsEdit])) then
    begin
       { Se o Contrato já foi encerrado. }
       stemp := trim(qry.FieldByName('FLGFIMCONTRATO').AsString);
       contratoflg := stemp[1];
       case contratoflg of
       'E':begin
              //BotaoEncerraCadastramento.Enabled := False;
              //BotaoEncerraContrato.Enabled      := False;
           end;
       { Verifica se o fim do cadastramento do contrato já foi realizado. }
       'S':begin
              //BotaoEncerraContrato.Enabled      := True;
              //BotaoEncerraCadastramento.Enabled := False;
            end;
       { Se o cadastramento do contrato não  foi realizado. }
       'N':begin
              //BotaoEncerraCadastramento.Enabled := True;
              //BotaoEncerraContrato.Enabled      := False;
           end;
       else
        begin
           //BotaoEncerraCadastramento.Enabled := False;
           //BotaoEncerraContrato.Enabled      := False;
        end;
       end;
    end;
     if (ds.DataSet.State = dsInsert)   then
         qryCODTIPDOC.asinteger:=0;
end;

procedure TfrmCadContrato.qryAfterInsert(DataSet: TDataSet);
begin
  inherited;
  if DBNomeContrato.CanFocus then DBNomeContrato.SetFocus;
  dbrgTipoContrato.ItemIndex := 0;
  DBValorBaseContrato.Value  := 0.00;
  qry.FieldByName('IDCONTRATO').AsInteger := LeUltRegistro(nil, 'CONTRATOCONTR');
  idContrato := qry.FieldByName('IDCONTRATO').AsInteger;
  qry.FieldByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  qry.FieldByName('FLGFIMCONTRATO').AsString := 'N';
  //BotaoEncerraCadastramento.Enabled := False;
  //BotaoEncerraContrato.Enabled      := False;
  SelecionaFilhos;
end;

procedure TfrmCadContrato.bbtnConfirmarClick(Sender: TObject);
{var
   modificou : Boolean;
   x : integer;}
begin
   { Verificando se todos os campos obrigatórios foram preenchidos. }
   if VerificaCamposPreenchidos = False then Exit;
   //Caso tenha ocorrido alguma alteracao em algum campo
   {modificou := false;
   if (qry.State in ([dsEdit])) then
    begin
       for x:=0 to qry.FieldCount - 1 do
       begin
          if qry.Fields[x].OldValue <> qry.Fields[x].NewValue then
           begin
              modificou := true;
              break;
           end;
        end;
    end;}

   if (qry.State in [dsEdit]) and (qry.Modified) then //(modificou) then
      //Só Contratos Cadastrado
{      if qry.FieldByName('FLGFIMCONTRATO').AsString = 'S' then
         begin
           Criando o Formulário do Aditamento do Contrato.
           try
              Application.CreateForm(TfrmCadAditamento, frmCadAditamento);
              frmCadAditamento.qryAditamento.Open;
              frmCadAditamento.dsAditamento.DataSet.Insert;
              frmCadAditamento.Caption := 'Aditamento do contrato '+qry.FieldByName('NOMECONTRATO').AsString;
              frmCadAditamento.qryAditamento.FieldByName('IDCONTRATO').Asfloat;
              frmCadAditamento.idcontrato := qry.FieldByName('IDCONTRATO').Asfloat;
              frmCadAditamento.ShowModal;
           finally
              frmCadAditamento.Free;
           end;
         end;
}
   inherited;
   SelecionaFilhos;
end;

procedure TfrmCadContrato.CmeCadastroConfirma(Sender: TObject);
begin
  if GpDotOrc.Enabled then
  begin
    if Orcamentoback.IdReserva <> 0 then
      qry.FieldByName('IdReservaOrcamen').AsInteger := Orcamentoback.IdReserva;
  end;

  ds.DataSet.CheckBrowseMode;
  dtmBaseDados.dbBaseDados.ApplyUpdates([qry]);

  if CmeCadastro.Operacao = OpInserir then
  begin
    qryContratoUsuario.ParamByName('IDCONTRATO').AsInteger:=qry.FieldByName('IDCONTRATO').AsInteger;
    qryContratoUsuario.ParamByName('IDUSUARIO').AsInteger :=Sistema.IdUsuario;
    qryContratoUsuario.ExecSQL;
  end;
end;

procedure TfrmCadContrato.dbrgTipoContratoChange(Sender: TObject);
begin
  inherited;
   if (ds.DataSet.State = dsInsert) or (ds.DataSet.State = dsEdit) then
     begin
      qryLookTipoDoc.Close;
      if dbrgTipoContrato.ItemIndex = 0 then begin
         qryLookTipoDoc.ParamByName('RECPAG').AsString:='R';
         qryLookTipoDoc.ParamByName('DEBCRE').AsString:='D';
      end else begin
         qryLookTipoDoc.ParamByName('RECPAG').AsString:='P';
         qryLookTipoDoc.ParamByName('DEBCRE').AsString:='C';
      end;
      qryLookTipoDoc.Open;

      case dbrgTipoContrato.ItemIndex of
      0 :CMPContraparte.ForCli := fcCliente;
      1 :CMPContraparte.ForCli := fcFornecedor;
      end;
     end;
end;

procedure TfrmCadContrato.sbtnAlterarClick(Sender: TObject);
begin
   if qry.FieldByName('FLGFIMCONTRATO').AsString = 'E' then
     begin
        ShowMessage('Contrato Encerrado não pode ser alterado');
        Exit;
     end
   else
     begin
       inherited;
       SelecionaFilhos;
     end;
end;

procedure TfrmCadContrato.CMPContraparteExit(Sender: TObject);
begin
   inherited;
   qryContato.Close;
   qryContato.ParamByName('IDPESSOA').AsInteger := qry.FieldByName('IDFORCLI').AsInteger;
   qryContato.Open;
   if not(qryContato.IsEmpty) then
    begin
       DBLookupComboContato.Enabled  := TRUE;
       DBLookupComboTelefone.Enabled := TRUE;
       If DBLookupComboContato.CanFocus then DBLookupComboContato.setfocus;
    end
   else
    begin
       DBLookupComboContato.Enabled  := FALSE;
       DBLookupComboTelefone.Enabled := FALSE;
    end;
   AtualizaEnderecos(qry.FieldByName('IDFORCLI').AsInteger);
end;


procedure TfrmCadContrato.btnOrcamentoClick(Sender: TObject);
begin
  inherited;
  MsResORc.Executar;
  if  MsResORc.RetornouValor then
   begin
      ReResOrc.Value := StrToInt(MsResORc.ValoresChave[1]);
      OrcamentoBack.IdReserva := StrToInt(MsResORc.ValoresChave[0]);
   end;
end;

procedure TfrmCadContrato.ReResOrcExit(Sender: TObject);
Var
  iValorRetorno: Integer;
begin
  inherited;
  if (ActiveControl.tag <> 9999) And (ReResOrc.Value > 0) then
   begin
      iValorRetorno := OrcamentoBack.BuscaIdNumReserva(0,Trunc(ReResOrc.Value),True);
      if iValorRetorno > 0 then
         OrcamentoBack.IdReserva := iValorRetorno
      else
       begin
          ReResOrc.Value := 0;
          if ReResOrc.CanFocus then ReResOrc.SetFocus;
       end;
   end
  else
   if (ReResOrc.Value <= 0) then OrcamentoBack.IdReserva := 0;
end;

procedure TfrmCadContrato.DBLookupComboContatoExit(Sender: TObject);
begin
  inherited;
  //
  qryTelefone.Close;
  qryTelefone.ParamByName('IDCONTATO').AsString := DBLookupComboContato.LookupValue;
  qryTelefone.Open;
  //
end;


procedure TfrmCadContrato.sbtnImagemClick(Sender: TObject);
begin
  inherited;
  AssociaImagem(dsImagem, TBlobField(qryImagem.FieldByName('IMAGEM')),
          TFloatField(qryImagem.FieldByName('IDIMAGEM')), 'Documento');
end;

procedure TfrmCadContrato.AssociaImagem(dsImg : TwwDataSource; pImagem : TBlobField; Campo : TFloatField; Descricao : string);
var frmImgDoc : TfrmImagemDoc;
begin
     try
        Application.CreateForm(tfrmImagemDoc, frmImgDoc);
        with frmImgDoc do
        begin
             dsImagem := dsImg;
             Imagem   := pImagem;
             CampoPai := Campo;

             bbtnAssociar.Enabled := (ds.Dataset.State = dsInsert) or (ds.Dataset.State = dsEdit);
             bbtnLimpar.Enabled := (ds.Dataset.State = dsInsert) or (ds.Dataset.State = dsEdit);
             Caption := Descricao;
             ShowModal;
        end;
     finally
          frmImgDoc.free;
     end;
end;


procedure TfrmCadContrato.qryAfterScroll(DataSet: TDataSet);
begin
  inherited;
  qryImagem.Close;
  qryImagem.ParamByName('IdContrato').AsFloat  := qry.FieldByName('IdContrato').AsFloat;
  qryImagem.Open;
  sbtnImagem.Visible    := not(qryImagem.EOF);
end;

end.

