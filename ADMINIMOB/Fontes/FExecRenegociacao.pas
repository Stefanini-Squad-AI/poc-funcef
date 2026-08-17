unit FExecRenegociacao;

//	-------------------------------------------------------------------------------------------------
//
//	Renegociação Contratual
//
//	Autor          :  André Pontes
//	Data de Início :  16/04/1999
//	Data de Término:  17/04/1999
//
//	Modificações	:
//
// -------------------------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, TREdit, Mask, Grids, Wwdbigrd,
  Wwdbgrid, Wwdbgrd2, wwdblook, ExtCtrls, MAHlpBtn, Buttons, TB97Tlbr, TB97,
  IvDictio, IvMulti, IvEMulti, Db, DBTables, Wwquery, Wwdatsrc, MontaSelect,
  DBCtrls2, wwdbedit, Wwdbspin, wwdbdatetimepicker, CMDateTimePicker,
  DBCtrls, FOkCancelarImob;

type
  TfrmExecRenegociacao = class(TFrmOkCancelarImob)
    dsReajustes: TwwDataSource;
    qryReajustes: TwwQuery;
    qryReajustesTipoReajuste: TStringField;
    dsContrato: TwwDataSource;
    qryReajustesEVIDATA: TDateTimeField;
    qryReajustesFLGTIPOEVENTO: TStringField;
    qryReajustesEVIVLRAJUSTADO: TFloatField;
    qryReajustesEVIDESCRICAO: TMemoField;
    qryReajustesEVIDATAPROX: TDateTimeField;
    qryReajustesEVIVLRANTERIOR: TFloatField;
    Label5: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dbgrdContratos: TwwDBGrid2;
    edtMotivo: TEdit;
    edtNovoValor: TRealEdit;
    DBedtMoeda: TDBEdit2;
    DBedtNomeContrato: TDBEdit2;
    grpReajuste: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label34: TLabel;
    Label11: TLabel;
    Label50: TLabel;
    DBedtProxReajuste: TCMDateTimePicker;
    DBcboIndiceReajuste: TwwDBLookupCombo;
    DBspnPeriodicidadeReajuste: TwwDBSpinEdit;
    DBedtUltReajuste: TCMDateTimePicker;
    edtValorAnterior: TRealEdit;
    btnBuscaContrato: TBitBtn;
    ToolbarSep975: TToolbarSep97;
    ToolbarSep976: TToolbarSep97;

    // outros procedimentos
    procedure btnBuscaContratoClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dbgrdContratosCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState;
    Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qryReajustesCalcFields(DataSet: TDataSet);



  private { Private declarations }
    iIdContrato : integer;
    sFiltroOriginal : string;  // filtro original do MS_Contrato

    // procedimentos definidos
    procedure AtualizaContrato;
    procedure LimpaCampos;
    function VerificaPreenchimento: boolean;
    procedure AbreQueries(i: integer);
    procedure FechaQueries;


  public { Public declarations }

  end;



var
  frmExecRenegociacao: TfrmExecRenegociacao;



implementation
{$R *.DFM}
Uses
   USistema, UMensErro, UDatabase, DBaseDados, FCadastroCS,
   UComunsImobiliario, uVerificaPreenchimento, dLookImobiliario, UFuncoesImob, uEventoImovel, dImobiliario,
  DMS;



procedure TfrmExecRenegociacao.AtualizaContrato;
var iRenegociacao: integer;
begin
   StartTransacao;

   try
      // atualizar valores do contrato não suportados pelos edits
      with dtmImobiliario.qryContratosReajuste do begin
         Edit;
         FieldByName('CONVLRTOTAL').asFloat    := edtValorAnterior.Value;
         // grava o novo valor
         FieldByName('CONVLRAJUSTADO').asFloat := edtNovoValor.Value;
         Post;
      end;

      iRenegociacao  := EventoImovel.ReajRenegContrato(iIdContrato,strtoint(DBcboIndiceReajuste.LookupValue),
                        trunc(DBspnPeriodicidadeReajuste.Value),edtValorAnterior.Value,edtNovoValor.Value,
                        DBedtUltReajuste.Date, DBedtProxReajuste.Date, true, 'RE', edtMotivo.Text);

      if iRenegociacao = 0 then begin
         dtmImobiliario.qryContratosReajuste.ApplyUpdates;
         CommitTransacao;
         MsgDlg('Contrato atualizado com sucesso.', 'Informação', mtInformation, [mbOk], 0);
         Repaint;
         LimpaCampos;
      end else begin
         dtmImobiliario.qryContratosReajuste.CancelUpdates;
         RollBackTransacao;
         MsgDlg('Houve erro na gravação do Contrato.', 'Erro', mtError, [mbOk], 0);
      end;

   except
      dtmImobiliario.qryContratosReajuste.CancelUpdates;
      RollBackTransacao;
      MsgDlg('Houve erro na gravação do Contrato.', 'Erro', mtError, [mbOk], 0);
   end;

   Screen.Cursor := crDefault;
   btnBuscaContrato.SetFocus;
end;


procedure TfrmExecRenegociacao.LimpaCampos;
begin
   dtmImobiliario.qryContratosReajuste.Close;
   qryReajustes.Close;

   edtNovoValor.Clear;
   edtMotivo.Clear;
   edtValorAnterior.Clear;
end;



function TfrmExecRenegociacao.VerificaPreenchimento: boolean;
begin

   Result := False;
   try

      if length(trim(DBedtNomeContrato.Text)) = 0 then
         raise EValidacao.CreateVal('É necessário indicar o Contrato!', btnBuscaContrato);

      if edtNovoValor.Value <= 0 then
         raise EValidacao.CreateVal('É necessário indicar o Novo Valor do Contrato!', edtNovoValor);

      if length(trim(DBedtUltReajuste.Text)) = 0 then
         raise EValidacao.CreateVal('É necessário indicar a Data a partir da qual será aplicado o Reajuste!', DBedtUltReajuste);

   except

      on ev : EValidacao do begin
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
			Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;

   Result := True;
end;



procedure TfrmExecRenegociacao.AbreQueries(i: integer);
begin

   LimpaParametros(dtmImobiliario.qryContratosReajuste);
   with dtmImobiliario.qryContratosReajuste do begin
      ParamByName('EMPRESAPROP').AsInteger := Sistema.IdEmpresa;
      ParamByName('CONTRATO').AsInteger := i;
      Open;
      edtValorAnterior.Value := dtmImobiliario.qryContratosReajusteCONVLRAJUSTADO.AsFloat;
   end;

   LimpaParametros(qryReajustes);
   with qryReajustes do begin
      ParamByName('PIDCONTRATOIMOVEL').AsInteger := i;
      Open;
   end;
end;



procedure TfrmExecRenegociacao.FechaQueries;
begin
   dtmImobiliario.qryContratosReajuste.Close;
	qryReajustes.Close;
   qryReajustes.Close;
   dtmLookImobiliario.qryLookMoeda.Close;
   dtmImobiliario.qryContratosReajuste.Close;
end;



procedure TfrmExecRenegociacao.btnBuscaContratoClick(Sender: TObject);
begin
   inherited;
   dtmMS.MS_Contrato.Executar;
   // redesenha o form na volta do MontaSelect
   Repaint;
   // se houve busca, abre a query principal com apenas o registro buscado
   if dtmMS.MS_Contrato.RetornouValor then begin
      Screen.Cursor := crDefault;
      iIdContrato := StrToInt(dtmMS.MS_Contrato.ValoresChave[0]);
      AbreQueries(iIdContrato);
      Screen.Cursor := crDefault;
   end;
end;



procedure TfrmExecRenegociacao.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;

   if VerificaPreenchimento then begin
      AtualizaContrato;
   end;
end;



procedure TfrmExecRenegociacao.dbgrdContratosCalcCellColors(Sender: TObject; Field: TField;
State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
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



procedure TfrmExecRenegociacao.FormCreate(Sender: TObject);
begin
   inherited;
   sFiltroOriginal := dtmMS.MS_Contrato.Filtro.Text;
   dtmMS.MS_Contrato.Filtro.Add('(C.CONDATAFIM > TO_DATE('''+FormatDateTime('dd/mm/yyyy',date)+''',''DD/MM/YYYY'')) OR (C.FLGINDETERMINADO = ''S'')');

   dtmLookImobiliario.qryLookMoeda.Open;
   dtmImobiliario.qryContratosReajuste.Open;
end;



procedure TfrmExecRenegociacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   FechaQueries;
   dtmMS.MS_Contrato.Filtro.Text := sFiltroOriginal;
end;



procedure TfrmExecRenegociacao.qryReajustesCalcFields(DataSet: TDataSet);
begin
   inherited;
   if qryReajustesFLGTIPOEVENTO.AsString = 'RE' then begin
      qryReajustesTipoReajuste.AsString := 'Renegociação';
   end else if qryReajustesFLGTIPOEVENTO.AsString = 'RJ' then begin
      qryReajustesTipoReajuste.AsString := 'Contratual';
   end;
end;



end.
