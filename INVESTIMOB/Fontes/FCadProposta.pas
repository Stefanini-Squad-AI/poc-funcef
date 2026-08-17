unit FCadProposta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, ComCtrls, IvDictio, IvMulti, IvEMulti, MontaSelect,
  DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, DBCtrls, Grids,
  Wwdbigrd, Wwdbgrid, wwriched, FCadastroCSImob, wwdbedit, Wwdotdot,
  Wwdbcomb, Mask, wwdbdatetimepicker, CMDateTimePicker, CmEventosCadastro,
  ImgList;

type
  TfrmCadProposta = class(TfrmCadastroCSImob)
    qryOutroDado: TwwQuery;
    dsOutroDado: TwwDataSource;
    qryHistorico: TwwQuery;
    dsHistorico: TwwDataSource;
    qryOutroDadoIDPROPOSTA: TFloatField;
    qryOutroDadoIDOUTRODADO: TFloatField;
    qryOutroDadoODPVALOR: TStringField;
    qryOutroDadoODODESCRICAO: TStringField;
    qryHistoricoIDPROPOSTA: TFloatField;
    qryHistoricoIDHISTPROPOSTA: TFloatField;
    qryHistoricoIDRESPONSAVEL: TFloatField;
    qryHistoricoHIPDATA: TDateTimeField;
    qryHistoricoHIPCABECALHO: TStringField;
    qryHistoricoPRODATA: TDateTimeField;
    qryHistoricoNOME_RESP: TStringField;
    qryHistoricoHIPDESCRICAO: TMemoField;
    qryIDPROPOSTA: TFloatField;
    qryIDEMPRESAPROP: TFloatField;
    qryIDRESPONSAVEL: TFloatField;
    qryIDPROPRIETARIOUH: TFloatField;
    qryCODTIPIMOVEL: TStringField;
    qryMOECODIGO: TFloatField;
    qryPRODATA: TDateTimeField;
    qryPRONOME: TStringField;
    qryPRODESCRICAO: TMemoField;
    qryPROVLROM: TFloatField;
    qryPROVLR: TFloatField;
    qryPROTIR: TFloatField;
    qryPROPAYBACK: TFloatField;
    qryPROCONDICOES: TMemoField;
    qryPROAPRESENTADA: TStringField;
    qryPRONUMERO: TStringField;
    qryIDIMOVELMESTRE: TFloatField;
    qryIDIMOVEL: TFloatField;
    qryNOME_MESTRE: TStringField;
    qryNOME_IMOVEL: TStringField;
    qryNF_PROPRIETARIO: TStringField;
    qryRS_PROPRIETARIO: TStringField;
    qryNF_USUARIO: TStringField;
    qryNOMEUSUARIO: TStringField;
    qryPRODATAINCLUSAO: TDateTimeField;
    qryIDUSUARIO: TFloatField;
    qryNF_PROPONENTE: TStringField;
    qryRS_PROPONENTE: TStringField;
    qryIDPROPONENTE: TFloatField;
    lblStatus: TLabel;
    qryFLGSTATUS: TStringField;
    pgc: TPageControl;
    tbsGeral: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label12: TLabel;
    Label15: TLabel;
    Bevel2: TBevel;
    Label16: TLabel;
    Bevel3: TBevel;
    Label17: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    edtDataProposta: TCMDateTimePicker;
    DBedtNomeProposta: TDBEdit;
    DBcboTipoImovel: TwwDBLookupCombo;
    DBedtApresentada: TDBEdit;
    DBedtNumeroProposta: TDBEdit;
    DBedtProponente: TDBEdit;
    btnBuscaProponente: TBitBtn;
    DBedtProprietario: TDBEdit;
    btnBuscaProprietario: TBitBtn;
    btnLimpaProprietario: TBitBtn;
    DBedtLoginUsu: TDBEdit;
    DBedtDataInclusao: TDBEdit;
    DBedtNomeUsu: TDBEdit;
    tbsDescricao: TTabSheet;
    DBmemDescricao: TDBMemo;
    Panel4: TPanel;
    tbsCondicoes: TTabSheet;
    Label3: TLabel;
    Moeda: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBedtValorOM: TDBEdit;
    DBedtValor: TDBEdit;
    DBcboMoeda: TwwDBLookupCombo;
    DBedtPayback: TDBEdit;
    DBedtTIR: TDBEdit;
    DBmemCondicoes: TDBMemo;
    Panel2: TPanel;
    tbsOutroDado: TTabSheet;
    DBgrd: TwwDBGrid;
    Panel1: TPanel;
    tbsHistorico: TTabSheet;
    Bevel1: TBevel;
    Label14: TLabel;
    Label11: TLabel;
    DBgrdEventos: TwwDBGrid;
    DBmemDescricaoHist: TDBMemo;
    DBcboStatus: TwwDBComboBox;
    Panel3: TPanel;

    procedure DBcboMoedaEnter(Sender: TObject);
    procedure DBcboMoedaExit(Sender: TObject);
    procedure DBedtValorOMExit(Sender: TObject);
    procedure DBgrdCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure DBgrdTopRowChanged(Sender: TObject);
    procedure DBgrdEventosCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure DBgrdEventosTopRowChanged(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnBuscaProponenteClick(Sender: TObject);
    procedure btnBuscaProprietarioClick(Sender: TObject);
    procedure btnLimpaProprietarioClick(Sender: TObject);


    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroAtualizaBotoes(Sender: TObject);
  private { Private declarations }
    iProposta        : integer;
    sTextoIniMoeda   : string;
    sTextoFimMoeda   : string;


    procedure Sel(i:integer);

    procedure FazerRefresh; override;

    procedure MostraStatus;

    function VerificaPreenchimento: boolean;

    procedure AbreQueries;
    procedure AbreDetalhes(i: integer);
    procedure FechaTabelas;

    procedure ConverteValorOM;

  public { Public declarations }

  end;



var
  frmCadProposta: TfrmCadProposta;



implementation
{$R *.DFM}
Uses
  uSistema, uMensErro, uDatabase, DBaseDados, uModulo, uComunsImobiliario, uVerificaPreenchimento, uFuncoesImob,
  dLookImobiliario, DMS;



procedure TfrmCadProposta.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
   inherited;

   MostraStatus;

   // habilita o painel de fundo (que contém o PageControl - orelhas)
   pnlFundo.Enabled := True;

   Case CmeCadastro.Operacao of

      opVazio:
      begin
         tbsGeral.Enabled        := False;
         tbsDescricao.Enabled    := False;
         tbsCondicoes.Enabled    := False;
         tbsHistorico.Enabled    := False;
      end;

      opIdle:
      begin
         tbsGeral.Enabled        := False;
         tbsDescricao.Enabled    := False;
         tbsCondicoes.Enabled    := False;
         tbsHistorico.Enabled    := False;
      end;

      opInserir:
      begin
         tbsGeral.Enabled        := True;
         tbsDescricao.Enabled    := True;
         tbsCondicoes.Enabled    := True;
         tbsHistorico.Enabled    := True;
      end;

      opAlterar:
      begin
         tbsGeral.Enabled        := True;
         tbsDescricao.Enabled    := True;
         tbsCondicoes.Enabled    := True;
         tbsHistorico.Enabled    := True;
      end;

      opProcurar:
      begin
         tbsGeral.Enabled        := False;
         tbsDescricao.Enabled    := False;
         tbsCondicoes.Enabled    := False;
         tbsHistorico.Enabled    := False;
      end;

      opApagar:
      begin
         tbsGeral.Enabled        := False;
         tbsDescricao.Enabled    := False;
         tbsCondicoes.Enabled    := False;
         tbsHistorico.Enabled    := False;
      end;

   end;
end;



procedure TfrmCadProposta.MostraStatus;
begin
   lblStatus.Visible := False;

   if qry.Active then begin

      lblStatus.Caption    := 'Ativa';
      lblStatus.Font.Color := clNavy;

      if not(qryFLGSTATUS.isNULL) then begin
         if qryFLGSTATUS.asString = 'I' then begin
            lblStatus.Caption    := 'Inativa';
            lblStatus.Font.Color := clGray;
         end;
      end;

      lblStatus.Visible    := True;
   end;
end;



procedure TfrmCadProposta.Sel(i: integer);
begin
   with qry do begin
      LimpaParametros(qry);
      ParamByName('PIDEMPRESAPROP').asInteger   := Sistema.idEmpresa;
      ParamByName('PIDPROPOSTA').asInteger      := i;
      Open;
   end;
end;



procedure TfrmCadProposta.CmeCadastroFind(Sender: TObject);
begin
	inherited;

   pgc.ActivePage := tbsGeral;

	// redesenha o form na volta do MontaSelect
	Repaint;

	// se houve busca, abre a query principal com apenas o registro buscado
	if dtmMS.MS_Proposta.RetornouValor then begin

      Screen.Cursor := crHourGlass;

      AbreQueries;

      iProposta := StrToInt(dtmMS.MS_Proposta.ValoresChave[0]);
      Sel(iProposta);

      AbreDetalhes(iProposta);

      Screen.Cursor := crDefault;
   end;

   if edtDataProposta.CanFocus then edtDataProposta.SetFocus;
end;



procedure TfrmCadProposta.CmeCadastroInsert(Sender: TObject);
begin
   pgc.ActivePage := tbsGeral;

   AbreQueries;

   Sel(-1);

   AbreDetalhes(iProposta);

   inherited;
    
   qryMOECODIGO.AsInteger        := Modulo.iMoedaCorrente;
   qryPRODATAINCLUSAO.AsDateTime := Date;
   qryIDUSUARIO.asInteger        := Sistema.idUsuario;
   qryFLGSTATUS.asString         := 'A';

   if edtDataProposta.CanFocus then edtDataProposta.SetFocus;
end;



procedure TfrmCadProposta.CmeCadastroEdit(Sender: TObject);
begin
   inherited;

   pgc.ActivePage := tbsGeral;

   if qryMOECODIGO.IsNull then qryMOECODIGO.AsInteger := Modulo.iMoedaCorrente;

   if edtDataProposta.CanFocus then edtDataProposta.SetFocus;
end;



procedure TfrmCadProposta.CmeCadastroConfirma(Sender: TObject);
begin
   try

      if qry.State = dsInsert then begin
         // grava a Empresa Proprietária
         qryIDEMPRESAPROP.asInteger := Sistema.idEmpresa;
         qryIDPROPOSTA.asInteger    := LeUltRegistro(nil, 'PROPOSTANOVONEGOC');
      end;

      inherited;

   except
      Screen.Cursor := crDefault;
      Raise;
      Repaint;
   end;

   pgc.ActivePage := tbsGeral;
	// redesenha o form na volta do MontaSelect
	Repaint;
end;



function TfrmCadProposta.VerificaPreenchimento: boolean;
begin
	Result := False;
	try

      // Data
		if ( (length(trim(edtDataProposta.Text)) = 0) or (qryPRODATA.isNULL) ) then
         raise EValidacao.CreateVal('É necessário indicar a Data da Proposta!', edtDataProposta);

      // Nome
		if ( (length(trim(DBedtNomeProposta.Text)) = 0) or (qryPRONOME.isNULL) ) then
         raise EValidacao.CreateVal('É necessário indicar o Nome da Proposta!', DBedtNomeProposta);

      // Tipo de Imóvel / Segmento
		if ( (DBcboTipoImovel.LookupValue = '') or (qryCODTIPIMOVEL.isNULL) ) then
         raise EValidacao.CreateVal('É necessário indicar o Tipo de Imóvel / Segmento!', DBcboTipoImovel);

      if not(qryFLGSTATUS.asString = 'I') then begin
   		if (qryIDPROPONENTE.isNULL) then
            raise EValidacao.CreateVal('É necessário indicar o Proponente!', btnBuscaProponente);
      end;

	except

      on ev : EValidacao do begin
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
			Repaint;
         pgc.ActivePage := tbsGeral;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;
   Result := True;
end;



procedure TfrmCadProposta.AbreQueries;
begin
   dtmLookImobiliario.qryLookMoeda.Open;
   dtmLookImobiliario.qryLookTipoImovel.Open;
end;



procedure TfrmCadProposta.AbreDetalhes(i: integer);
begin
   with qryOutroDado do begin
      LimpaParametros(qryOutroDado);
      Params[0].asInteger  := i;
      Open;
   end;

   with qryHistorico do begin
      LimpaParametros(qryHistorico);
      Params[0].asInteger  := i;
      Open;
   end;
end;



procedure TfrmCadProposta.FechaTabelas;
begin
   qry.Close;
   qryOutroDado.Close;
end;



procedure TfrmCadProposta.ConverteValorOM;
var
   iMoeda            : integer;
   dData             : TDateTime;
   fValor, fValorOM  : currency;
   sMensagem         : string;
begin
   if ( ( sTextoIniMoeda <> sTextoFimMoeda) or (DBedtValorOM.Modified) ) then begin
      if length(trim(DBcboMoeda.Text)) = 0 then begin
         // se a combo não estiver preenchida, limpa a campo MOECODIGO
         if qry.State in [dsInsert, dsEdit] then qry.FieldByName('MOECODIGO').Value := NULL;
      end else begin
         if ( (length(trim(DBcboMoeda.Text)) > 0) and (qryPROVLROM.asFloat > 0) ) then begin
            // se a Moeda e o ValorOM preenchidos, converte o valor

            dData       := edtDataProposta.Date;
            iMoeda      := StrToInt(DBcboMoeda.LookupValue);
            fValorOM    := qryPROVLROM.asFloat;

            fValor := FuncoesImob.ConverteMoeda(iMoeda, fValorOM, dData, True);

            // verifica se houve conversão com a cotação de hoje...
            if fValor = -1 then begin
               sMensagem   := 'Não existe cotação atualizada para a Moeda selecionada! ' + chr(13) +
                              'Deseja utilizar a última cotação cadastrada?';

               // não havendo, pergunta se deseja-se usar a última cotação cadastrada...
               if MsgDlg(sMensagem, 'Aviso', mtWarning, [mbYes, mbNo], 0) = mrYes then begin;
                  Repaint;
                  // tenta a conversão com a última cotação cadastrada...
                  fValor := FuncoesImob.ConverteMoeda(iMoeda, fValorOM, dData, False);

                  // se mesmo assim não for possível:
                  if fValor = -1 then begin

                     sMensagem   := 'Não existe cotação para a Moeda selecionada! ' + chr(13) +
                                    'Favor verificar.';
                     MsgDlg(sMensagem, 'Erro', mtError, [mbOk], 0);
                     Repaint;
                     DBcboMoeda.SetFocus;

                  end else begin

                     qryPROVLR.asFloat       := fValor;
                     DBedtValorOM.Modified   := False;

                  end;

               end else begin
                  // não se desejando fazer conversão pela última cotação cadastrada:
                  Repaint;
                  DBcboMoeda.SetFocus;
               end;

            end else begin

               // houve conversão; preenche os valores de acordo com pagar/receber
               qryPROVLR.asFloat       := fValor;
               DBedtValorOM.Modified   := False;

            end;

         end;
      end;
   end;
end;



procedure TfrmCadProposta.FazerRefresh;
begin
   dtmLookImobiliario.qryLookMoeda.Close;
   dtmLookImobiliario.qryLookMoeda.Open;

   dtmLookImobiliario.qryLookTipoImovel.Close;
   dtmLookImobiliario.qryLookTipoImovel.Open;

   qryOutroDado.Close;
   qryOutroDado.Open;

   qryHistorico.Close;
   qryHistorico.Open;
end;



procedure TfrmCadProposta.DBcboMoedaEnter(Sender: TObject);
begin
   inherited;
   sTextoIniMoeda := DBcboMoeda.Text;
end;



procedure TfrmCadProposta.DBcboMoedaExit(Sender: TObject);
begin
   inherited;
   sTextoFimMoeda := DBcboMoeda.Text;
   ConverteValorOM;
end;



procedure TfrmCadProposta.DBedtValorOMExit(Sender: TObject);
begin
   inherited;
   ConverteValorOM;
end;



procedure TfrmCadProposta.DBgrdCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState;
Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;
   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end else begin
            ABrush.Color := clWhite;
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmCadProposta.DBgrdTopRowChanged(Sender: TObject);
begin
   inherited;
   // acerta as cores quando muda a linha da grid
   DBgrd.Invalidate;
end;



procedure TfrmCadProposta.DBgrdEventosCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState;
Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;
   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end else begin
            ABrush.Color := clWhite;
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmCadProposta.DBgrdEventosTopRowChanged(Sender: TObject);
begin
   inherited;
   // acerta as cores quando muda a linha da grid
   DBgrdEventos.Invalidate;
end;



procedure TfrmCadProposta.sbtnProcurarClick(Sender: TObject);
begin
   CmeCadastro.Operacao := opProcurar;

   dtmMS.MS_Proposta.Executar;

   CmeCadastro.Find(Self);

   if qry.IsEmpty then begin
      CmeCadastro.Operacao := opVazio
   end else begin
      CmeCadastro.Operacao := opIdle;
   end;

   CmeCadastro.AtualizaBotoes(self);
end;



procedure TfrmCadProposta.bbtnConfirmarClick(Sender: TObject);
begin
   if VerificaPreenchimento then inherited;
end;



procedure TfrmCadProposta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FechaTabelas;
   inherited;
end;



procedure TfrmCadProposta.btnBuscaProponenteClick(Sender: TObject);
begin
   inherited;

   if qry.State in dsEditModes then begin

      dtmMS.MS_Proprietario.Executar;

      // redesenha o form na volta do MontaSelect
      Repaint;

      // se houve busca,
      if dtmMS.MS_Proprietario.RetornouValor then begin

         Screen.Cursor := crHourGlass;

         qryIDPROPONENTE.asInteger  := StrToInt(dtmMS.MS_Proprietario.ValoresChave[0]);
         qryNF_PROPONENTE.asString  := dtmMS.MS_Proprietario.ValoresChave[1];
         qryRS_PROPONENTE.AsString  := dtmMS.MS_Proprietario.ValoresChave[2];

      end;

   end;

   Screen.Cursor := crDefault;
end;



procedure TfrmCadProposta.btnBuscaProprietarioClick(Sender: TObject);
begin
   inherited;

   if qry.State in dsEditModes then begin

      dtmMS.MS_Proprietario.Executar;

      // redesenha o form na volta do MontaSelect
      Repaint;

      // se houve busca,
      if dtmMS.MS_Proprietario.RetornouValor then begin

         Screen.Cursor := crHourGlass;

         qryIDPROPRIETARIOUH.asInteger := StrToInt(dtmMS.MS_Proprietario.ValoresChave[0]);
         qryNF_PROPRIETARIO.asString   := dtmMS.MS_Proprietario.ValoresChave[1];
         qryRS_PROPRIETARIO.AsString   := dtmMS.MS_Proprietario.ValoresChave[2];

      end;

   end;

   Screen.Cursor := crDefault;
end;



procedure TfrmCadProposta.btnLimpaProprietarioClick(Sender: TObject);
begin
   inherited;

   qryIDPROPRIETARIOUH.Clear;
   qryNF_PROPRIETARIO.Clear;
   qryRS_PROPRIETARIO.Clear;
end;



end.
