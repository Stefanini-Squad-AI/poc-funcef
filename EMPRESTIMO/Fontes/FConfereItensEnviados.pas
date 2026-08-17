unit FConfereItensEnviados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjudaImob, ComCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, AxCtrls, OleCtrls, vcf1,
  Mask, wwdbedit, Wwdbspin, wwdblook, CheckLst, fcButton, fcImgBtn,
  fcShapeBtn, Db, DBTables, Wwquery,
  uTypesEmptmo;

type
  TfrmConfereItensEnviados = class(TfrmSairAjudaImob)
    pgcGeral: TPageControl;
    tbsFiltro: TTabSheet;
    tbsResultado: TTabSheet;
    btnContinuar: TfcShapeBtn;
    Label6: TLabel;
    Label7: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    lstPatro: TCheckListBox;
    btnInvertePatro: TBitBtn;
    btnMarcaTodosPatro: TBitBtn;
    lstPlano: TCheckListBox;
    btnInvertePlano: TBitBtn;
    btnMarcaTodosPlano: TBitBtn;
    DBcboTipoContrato: TwwDBLookupCombo;
    Panel1: TPanel;
    Label15: TLabel;
    DBspnAno: TwwDBSpinEdit;
    cboMes: TComboBox;
    GroupBox1: TGroupBox;
    chkFinanceiro: TCheckBox;
    chkFolhaPatro: TCheckBox;
    chkFolhaBenef: TCheckBox;
    DBcboTipoEmptmo: TwwDBLookupCombo;
    Panel2: TPanel;
    qryConcessoes: TwwQuery;
    qryParcelas: TwwQuery;
    qryParcelaAtr: TwwQuery;
    qryQuitacoes: TwwQuery;
    qryAmortizacoes: TwwQuery;
    qryEncargos: TwwQuery;
    qryQuitMort: TwwQuery;
    qryTipoContrato: TwwQuery;
    qryTipoContratoIDTIPOCONTREMPTMO: TFloatField;
    qryTipoContratoTCEDESCRICAO: TStringField;
    btnVoltar: TfcShapeBtn;
    qryConcessoesIDHISTMOVEMPTMO: TFloatField;
    qryConcessoesIDCONTRATOEMPTMO: TFloatField;
    qryConcessoesHMEFORMACOBRANCA: TStringField;
    qryConcessoesHMEVLRPREVISTO: TFloatField;
    qryParcelasIDHISTMOVEMPTMO: TFloatField;
    qryParcelasIDCONTRATOEMPTMO: TFloatField;
    qryParcelasHMEFORMACOBRANCA: TStringField;
    qryParcelasHMEVLRPREVISTO: TFloatField;
    qryQuitMortIDHISTMOVEMPTMO: TFloatField;
    qryQuitMortIDCONTRATOEMPTMO: TFloatField;
    qryQuitMortHMEFORMACOBRANCA: TStringField;
    qryQuitMortHMEVLRPREVISTO: TFloatField;
    qryQuitacoesIDHISTMOVEMPTMO: TFloatField;
    qryQuitacoesIDCONTRATOEMPTMO: TFloatField;
    qryQuitacoesHMEFORMACOBRANCA: TStringField;
    qryQuitacoesHMEVLRPREVISTO: TFloatField;
    qryAmortizacoesIDHISTMOVEMPTMO: TFloatField;
    qryAmortizacoesIDCONTRATOEMPTMO: TFloatField;
    qryAmortizacoesHMEFORMACOBRANCA: TStringField;
    qryAmortizacoesHMEVLRPREVISTO: TFloatField;
    qryEncargosIDHISTMOVEMPTMO: TFloatField;
    qryEncargosIDCONTRATOEMPTMO: TFloatField;
    qryEncargosHMEFORMACOBRANCA: TStringField;
    qryEncargosHMEVLRPREVISTO: TFloatField;
    qryParcelaAtrIDHISTMOVEMPTMO: TFloatField;
    qryParcelaAtrIDCONTRATOEMPTMO: TFloatField;
    qryParcelaAtrHMEFORMACOBRANCA: TStringField;
    qryParcelaAtrHMEVLRPREVISTO: TFloatField;
    planilha: TF1Book;
    procedure FormShow(Sender: TObject);
    procedure btnMarcaTodosPatroClick(Sender: TObject);
    procedure btnMarcaTodosPlanoClick(Sender: TObject);
    procedure btnInvertePatroClick(Sender: TObject);
    procedure btnInvertePlanoClick(Sender: TObject);
    procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure lstPatroClickCheck(Sender: TObject);
    procedure lstPlanoClickCheck(Sender: TObject);
    procedure btnContinuarClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);

  private
    { Private declarations }
      vIDPatro, vIDPlano   : array of Int64;
      vPatro               : array of TPatro;
      vPlano               : array of TPlano;

      sFormaCobranca : String;
      sTipoFolha     : String;

      procedure PreenchePatro;
      procedure MarcaTodosPatro;
      function PegaPatro: String;

      procedure PreenchePlano;
      procedure MarcaTodosPlano;
      function PegaPlano: String;

      procedure AbreQueries;

      procedure MontaQuery; 
      procedure FiltraRelatorio;
  public
    { Public declarations }
  end;

var
  frmConfereItensEnviados: TfrmConfereItensEnviados;

implementation

{$R *.DFM}

uses
   DLookEmptmo,
   UDiasUteis,
   USistema,
   UfuncoesEmptmo, FProgresso,
   uMensErro;

procedure TfrmConfereItensEnviados.PreenchePatro;
var
   i : Integer;
begin
   // Abre a tabela de patrocinadoras
   if not(dtmLookEmptmo.qryLookPatro.Active) then dtmLookEmptmo.qryLookPatro.Open;
   dtmLookEmptmo.qryLookPatro.First;

   // Limpa a lista
   lstPatro.Items.Clear;

   // Inicializa o vetor
   i := 0;

   // Preenche a listbox de patrocinadoras e o vetor...
   while not(dtmLookEmptmo.qryLookPatro.EOF) do begin

      inc(i);
      SetLength(vPatro, i);
      vPatro[i-1].IDPatro     := dtmLookEmptmo.qryLookPatroIDPESSOA.AsInteger;
      vPatro[i-1].NomePatro   := dtmLookEmptmo.qryLookPatroNOME.AsString;
      vPatro[i-1].FlgMarcado  := True;

      lstPatro.Items.Add(dtmLookEmptmo.qryLookPatroNOME.AsString);

      dtmLookEmptmo.qryLookPatro.Next;
   end;
end;



procedure TfrmConfereItensEnviados.MarcaTodosPatro;
var
   i : Integer;
begin
   // ...e marca todas por default
   for i := 0 to (lstPatro.Items.Count - 1) do lstPatro.Checked[i] := True;
end;



function TfrmConfereItensEnviados.PegaPatro: String;
var
   i        : Integer;
   sPatros  : String;
begin
   inherited;

   sPatros := '';

   // concatena a String de patros
   for i := 0 to (lstPatro.Items.Count - 1) do begin
      if lstPatro.Checked[i] then begin
         if sPatros <> '' then sPatros := sPatros + ', ';
         sPatros := sPatros + IntToStr(vPatro[i].IdPatro);
      end;
      vPatro[i].FlgMarcado := lstPatro.Checked[i];
   end;

   Result := sPatros;
end;



procedure TfrmConfereItensEnviados.PreenchePlano;
var
   i : Integer;
begin
   // Abre a tabela de Planos
   if not(dtmLookEmptmo.qryLookPlanPrev.Active) then dtmLookEmptmo.qryLookPlanPrev.Open;
   dtmLookEmptmo.qryLookPlanPrev.First;

   // Limpa a lista
   lstPlano.Items.Clear;

   // Inicializa o vetor
   i := 0;

   // Preenche a listbox de planos e o vetor...
   while not(dtmLookEmptmo.qryLookPlanPrev.EOF) do begin

      inc(i);
      SetLength(vPlano, i);
      vPlano[i-1].IDPlano     := dtmLookEmptmo.qryLookPlanPrevIDPLANOPREV.AsInteger;
      vPlano[i-1].NomePlano   := dtmLookEmptmo.qryLookPlanPrevNOME.AsString;
      vPlano[i-1].FlgMarcado  := True;

      lstPlano.Items.Add(dtmLookEmptmo.qryLookPlanPrevNOME.AsString);
      dtmLookEmptmo.qryLookPlanPrev.Next;
   end;
end;



procedure TfrmConfereItensEnviados.MarcaTodosPlano;
var
   i : Integer;
begin
   // ...e marca todas por default
   for i := 0 to (lstPlano.Items.Count - 1) do lstPlano.Checked[i] := True;
end;



function TfrmConfereItensEnviados.PegaPlano: String;
var
   i        : Integer;
   sPlanos  : String;
begin
   inherited;

   sPlanos := '';

   // concatena a String de planos
   for i := 0 to (lstPlano.Items.Count - 1) do begin
      if lstPlano.Checked[i] then begin
         if sPlanos <> '' then sPlanos := sPlanos + ', ';
         sPlanos := sPlanos + IntToStr(vPlano[i].IdPlano);
      end;
      vPlano[i].FlgMarcado := lstPatro.Checked[i];
   end;

   Result := sPlanos;
end;



procedure TfrmConfereItensEnviados.AbreQueries;
begin
   with dtmLookEmptmo.qryLookTipoEmptmo do begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoEmptmo);
      ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;
      Open;
   end;

   // Tipo de Contrato
   LimpaParametros(dtmLookEmptmo.qryLookPlanPrev);
   dtmLookEmptmo.qryLookPlanPrev.Open;
end;




procedure TfrmConfereItensEnviados.MontaQuery;
begin
   inherited;

   FiltraRelatorio;
end;

procedure TfrmConfereItensEnviados.FiltraRelatorio;
var
   i, j, k : Integer;
   fTotal  : Currency;
   iLinha  : Integer;
begin
   (* monta a forma de cobrança ------------------------------------------------------------------- *)


   sFormaCobranca := '';
   sTipoFolha     := '';

   if chkFinanceiro.Checked then sFormaCobranca := QuotedStr('C');

   if ( (chkFolhaPatro.Checked) or (chkFolhaBenef.Checked) ) then begin
      if sFormaCobranca <> '' then begin
         sFormaCobranca := sFormaCobranca + ',' + QuotedStr('F')
      end else begin
         sFormaCobranca := QuotedStr('F');
      end;
   end;

   if chkFolhaPatro.Checked then sTipoFolha := QuotedStr('P');

   if chkFolhaBenef.Checked then begin
      if sTipoFolha <> '' then begin
         sTipoFolha := sTipoFolha + ',' + QuotedStr('B')
      end else begin
         sTipoFolha := QuotedStr('B');
      end;
   end;


   qryTipoContrato.Sql.Clear;
   qryTipoContrato.Sql.Add('SELECT IDTIPOCONTREMPTMO, TCEDESCRICAO');
   qryTipoContrato.Sql.Add('FROM TIPOCONTREMPTMO');
   if DBcboTipoContrato.Text <> '' then
      qryTipoContrato.Sql.Add('WHERE IDTIPOCONTREMPTMO = ' + DBcboTipoContrato.LookupValue);
   qryTipoContrato.Sql.Add('ORDER BY TCEDESCRICAO');
   qryTipoContrato.Open;

   iLinha := 1;

   for k := 0 to High(vPatro) do begin

      if vPatro[k].FlgMarcado then begin
         for j := 0 to High(vPlano) do begin

            if vPlano[j].FlgMarcado then begin
               qryTipoContrato.First;

               MostraFormProgresso('Gerando informações para: ' + vPatro[k].NomePatro + ' / ' + vPlano[j].NomePlano + '...', 0, qryTipoContrato.RecordCount, True, True);
               i := 0;

               fTotal := 0;
               while not qryTipoContrato.Eof do begin

                  (* Atualizando a Barra de Progresso *)
                  AndaFormProgresso(i);

                  (* Verifica se o usuário Cancelou a Operação *)
                  if frmProgresso.Cancelou then Exit;

                  (* Busca Concessões *)

                  with qryConcessoes do begin
                     LimpaParametros(qryConcessoes);
                     ParamByName('PHMEMESCOMPETENCIA').AsInteger  := cboMes.ItemIndex + 1;
                     ParamByName('PHMEANOCOMPETENCIA').AsInteger  := trunc(DBspnAno.Value);
                     ParamByName('PIDPESSOA').AsInteger           := vPatro[k].IDPatro;
                     ParamByName('PIDPLANOPREV').AsInteger        := vPlano[j].IDPlano;
                     ParamByName('PIDTIPOCONTREMPTMO').AsInteger  := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     ParamByName('PIDEMPRESAPROP').AsInteger      := Sistema.IDEmpresa;
                     Open;

                     if not(isEmpty) then begin
                        while not eof do begin
                           (* Grava na Planilha *)
                           Planilha.TextRC[ilinha,  1]   := 'Concessões';
                           Planilha.TextRC[iLinha,  2]   := vPatro[k].NomePatro;
                           Planilha.TextRC[iLinha,  3]   := vPlano[j].NomePlano;
                           Planilha.TextRC[iLinha,  4]   := qryTipoContratoTCEDESCRICAO.AsString;
                           Planilha.TextRC[ilinha,  5]   := FieldByName('IDCONTRATOEMPTMO').AsString;
                           Planilha.NumberRC[ilinha,6]   := FieldByName('HMEVLRPREVISTO').AsCurrency;
                           Planilha.TextRC[ilinha,  7]   := FieldByName('HMEFORMACOBRANCA').AsString;
                           Inc(iLinha);
                           fTotal := fTotal + FieldByName('HMEVLRPREVISTO').AsCurrency;
                           Next;
                        end;
                       (* Grava na Planilha o total *)
                        Inc(iLinha);
                        Planilha.TextRC[ilinha, 1]   := 'Total de Concessões';
                        Planilha.NumberRC[ilinha,6]  := fTotal;
                        Inc(iLinha,2);
                        fTotal := 0;
                     end;
                     Close;
                  end;

                  Repaint;
                  Application.ProcessMessages;

                  (* Busca Parcelas *)
                  with qryParcelas do begin
                     LimpaParametros(qryParcelas);
                     ParamByName('PHMEMESCOMPETENCIA').AsInteger  := cboMes.ItemIndex + 1;
                     ParamByName('PHMEANOCOMPETENCIA').AsInteger  := trunc(DBspnAno.Value);
                     ParamByName('PIDPESSOA').AsInteger           := vPatro[k].IDPatro;
                     ParamByName('PIDPLANOPREV').AsInteger        := vPlano[j].IDPlano;
                     ParamByName('PIDTIPOCONTREMPTMO').AsInteger  := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     ParamByName('PIDEMPRESAPROP').AsInteger      := Sistema.IDEmpresa;
                     Open;

                     if not(isEmpty) then begin
                        while not eof do begin
                           (* Grava na Planilha *)
                           Planilha.TextRC[ilinha,  1]   := 'Parcelas Geradas';
                           Planilha.TextRC[iLinha,  2]   := vPatro[k].NomePatro;
                           Planilha.TextRC[iLinha,  3]   := vPlano[j].NomePlano;
                           Planilha.TextRC[iLinha,  4]   := qryTipoContratoTCEDESCRICAO.AsString;
                           Planilha.TextRC[ilinha,  5]   := FieldByName('IDCONTRATOEMPTMO').AsString;
                           Planilha.NumberRC[ilinha,6]   := FieldByName('HMEVLRPREVISTO').AsCurrency;
                           Planilha.TextRC[ilinha,  7]   := FieldByName('HMEFORMACOBRANCA').AsString;
                           Inc(iLinha);
                           fTotal := fTotal + FieldByName('HMEVLRPREVISTO').AsCurrency;
                           Next;
                        end;
                       (* Grava na Planilha o total *)
                        Inc(iLinha);
                        Planilha.TextRC[ilinha, 1]   := 'Total de Parcelas Geradas';
                        Planilha.NumberRC[ilinha,6]  := fTotal;
                        Inc(iLinha,2);
                        fTotal := 0;
                     end;
                     Close;
                  end;

                  Repaint;
                  Application.ProcessMessages;


                  (* Busca Totais de Parcelas Atrasadas *)

                  with qryParcelaAtr do begin
                     LimpaParametros(qryParcelaAtr);
                     ParamByName('PHMEMESCOMPETENCIA').AsInteger  := cboMes.ItemIndex + 1;
                     ParamByName('PHMEANOCOMPETENCIA').AsInteger  := trunc(DBspnAno.Value);
                     ParamByName('PIDPESSOA').AsInteger           := vPatro[k].IDPatro;
                     ParamByName('PIDPLANOPREV').AsInteger        := vPlano[j].IDPlano;
                     ParamByName('PIDTIPOCONTREMPTMO').AsInteger  := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     ParamByName('PIDEMPRESAPROP').AsInteger      := Sistema.IDEmpresa;
                     Open;

                     if not(isEmpty) then begin
                        while not eof do begin
                           (* Grava na Planilha *)
                           Planilha.TextRC[ilinha,  1]   := 'Parcelas Atrasadas';
                           Planilha.TextRC[iLinha,  2]   := vPatro[k].NomePatro;
                           Planilha.TextRC[iLinha,  3]   := vPlano[j].NomePlano;
                           Planilha.TextRC[iLinha,  4]   := qryTipoContratoTCEDESCRICAO.AsString;
                           Planilha.TextRC[ilinha,  5]   := FieldByName('IDCONTRATOEMPTMO').AsString;
                           Planilha.NumberRC[ilinha,6]   := FieldByName('HMEVLRPREVISTO').AsCurrency;
                           Planilha.TextRC[ilinha,  7]   := FieldByName('HMEFORMACOBRANCA').AsString;
                           Inc(iLinha);
                           fTotal := fTotal + FieldByName('HMEVLRPREVISTO').AsCurrency;
                           Next;
                        end;
                       (* Grava na Planilha o total *)
                        Inc(iLinha);
                        Planilha.TextRC[ilinha, 1]   := 'Total de Parcelas Atrasadas';
                        Planilha.NumberRC[ilinha,6]  := fTotal;
                        Inc(iLinha,2);
                        fTotal := 0;
                     end;
                     Close;
                  end;

                  Repaint;
                  Application.ProcessMessages;


                  (* Busca Encargos *)
                  with qryEncargos do begin
                     LimpaParametros(qryEncargos);
                     ParamByName('PHMEMESCOMPETENCIA').AsInteger  := cboMes.ItemIndex + 1;
                     ParamByName('PHMEANOCOMPETENCIA').AsInteger  := trunc(DBspnAno.Value);
                     ParamByName('PIDPESSOA').AsInteger           := vPatro[k].IDPatro;
                     ParamByName('PIDPLANOPREV').AsInteger        := vPlano[j].IDPlano;
                     ParamByName('PIDTIPOCONTREMPTMO').AsInteger  := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     ParamByName('PIDEMPRESAPROP').AsInteger      := Sistema.IDEmpresa;
                     Open;

                     if not(isEmpty) then begin
                        while not eof do begin
                           (* Grava na Planilha *)
                           Planilha.TextRC[ilinha,  1]   := 'Encargos';
                           Planilha.TextRC[iLinha,  2]   := vPatro[k].NomePatro;
                           Planilha.TextRC[iLinha,  3]   := vPlano[j].NomePlano;
                           Planilha.TextRC[iLinha,  4]   := qryTipoContratoTCEDESCRICAO.AsString;
                           Planilha.TextRC[ilinha,  5]   := FieldByName('IDCONTRATOEMPTMO').AsString;
                           Planilha.NumberRC[ilinha,6]   := FieldByName('HMEVLRPREVISTO').AsCurrency;
                           Planilha.TextRC[ilinha,  7]   := FieldByName('HMEFORMACOBRANCA').AsString;
                           Inc(iLinha);
                           fTotal := fTotal + FieldByName('HMEVLRPREVISTO').AsCurrency;
                           Next;
                        end;
                       (* Grava na Planilha o total *)
                        Inc(iLinha);
                        Planilha.TextRC[ilinha, 1]   := 'Total de Encargos';
                        Planilha.NumberRC[ilinha,6]  := fTotal;
                        Inc(iLinha,2);
                        fTotal := 0;
                     end;
                     Close;
                  end;

                  Repaint;
                  Application.ProcessMessages;

                  (* Busca Amortizações *)
                  with qryAmortizacoes do begin
                     LimpaParametros(qryAmortizacoes);
                     ParamByName('PHMEMESCOMPETENCIA').AsInteger  := cboMes.ItemIndex + 1;
                     ParamByName('PHMEANOCOMPETENCIA').AsInteger  := trunc(DBspnAno.Value);
                     ParamByName('PIDPESSOA').AsInteger           := vPatro[k].IDPatro;
                     ParamByName('PIDPLANOPREV').AsInteger        := vPlano[j].IDPlano;
                     ParamByName('PIDTIPOCONTREMPTMO').AsInteger  := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     ParamByName('PIDEMPRESAPROP').AsInteger      := Sistema.IDEmpresa;
                     Open;

                     if not(isEmpty) then begin
                        while not eof do begin
                           (* Grava na Planilha *)
                           Planilha.TextRC[ilinha,  1]   := 'Amortizações';
                           Planilha.TextRC[iLinha,  2]   := vPatro[k].NomePatro;
                           Planilha.TextRC[iLinha,  3]   := vPlano[j].NomePlano;
                           Planilha.TextRC[iLinha,  4]   := qryTipoContratoTCEDESCRICAO.AsString;
                           Planilha.TextRC[ilinha,  5]   := FieldByName('IDCONTRATOEMPTMO').AsString;
                           Planilha.NumberRC[ilinha,6]   := FieldByName('HMEVLRPREVISTO').AsCurrency;
                           Planilha.TextRC[ilinha,  7]   := FieldByName('HMEFORMACOBRANCA').AsString;
                           Inc(iLinha);
                           fTotal := fTotal + FieldByName('HMEVLRPREVISTO').AsCurrency;
                           Next;
                        end;
                       (* Grava na Planilha o total *)
                        Inc(iLinha);
                        Planilha.TextRC[ilinha, 1]   := 'Total de Amortizações';
                        Planilha.NumberRC[ilinha,6]  := fTotal;
                        Inc(iLinha,2);
                        fTotal := 0;
                     end;
                     Close;
                  end;

                  Repaint;
                  Application.ProcessMessages;

                  (* Busca Quitacoes *)
                  with qryQuitacoes do begin
                     LimpaParametros(qryQuitacoes);
                     ParamByName('PHMEMESCOMPETENCIA').AsInteger  := cboMes.ItemIndex + 1;
                     ParamByName('PHMEANOCOMPETENCIA').AsInteger  := trunc(DBspnAno.Value);
                     ParamByName('PIDPESSOA').AsInteger           := vPatro[k].IDPatro;
                     ParamByName('PIDPLANOPREV').AsInteger        := vPlano[j].IDPlano;
                     ParamByName('PIDTIPOCONTREMPTMO').AsInteger  := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     ParamByName('PIDEMPRESAPROP').AsInteger      := Sistema.IDEmpresa;
                     Open;
                     if not(isEmpty) then begin
                        while not eof do begin
                           (* Grava na Planilha *)
                           Planilha.TextRC[ilinha,  1]   := 'Quitações';
                           Planilha.TextRC[iLinha,  2]   := vPatro[k].NomePatro;
                           Planilha.TextRC[iLinha,  3]   := vPlano[j].NomePlano;
                           Planilha.TextRC[iLinha,  4]   := qryTipoContratoTCEDESCRICAO.AsString;
                           Planilha.TextRC[ilinha,  5]   := FieldByName('IDCONTRATOEMPTMO').AsString;
                           Planilha.NumberRC[ilinha,6]   := FieldByName('HMEVLRPREVISTO').AsCurrency;
                           Planilha.TextRC[ilinha,  7]   := FieldByName('HMEFORMACOBRANCA').AsString;
                           Inc(iLinha);
                           fTotal := fTotal + FieldByName('HMEVLRPREVISTO').AsCurrency;
                           Next;
                        end;
                       (* Grava na Planilha o total *)
                        Inc(iLinha);
                        Planilha.TextRC[ilinha, 1]   := 'Total de Quitações';
                        Planilha.NumberRC[ilinha,6]  := fTotal;
                        Inc(iLinha,2);
                        fTotal := 0;
                     end;
                     Close;
                  end;

                  Repaint;
                  Application.ProcessMessages;

                  (* Busca Quitacoes por Morte *)
                  with qryQuitMort do begin
                     LimpaParametros(qryQuitMort);
                     ParamByName('PHMEMESCOMPETENCIA').AsInteger  := cboMes.ItemIndex + 1;
                     ParamByName('PHMEANOCOMPETENCIA').AsInteger  := trunc(DBspnAno.Value);
                     ParamByName('PIDPESSOA').AsInteger           := vPatro[k].IDPatro;
                     ParamByName('PIDPLANOPREV').AsInteger        := vPlano[j].IDPlano;
                     ParamByName('PIDTIPOCONTREMPTMO').AsInteger  := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     ParamByName('PIDEMPRESAPROP').AsInteger      := Sistema.IDEmpresa;
                     Open;
                     if not(isEmpty) then begin
                        while not eof do begin
                           (* Grava na Planilha *)
                           Planilha.TextRC[ilinha,  1]   := 'Quitações por Morte';
                           Planilha.TextRC[iLinha,  2]   := vPatro[k].NomePatro;
                           Planilha.TextRC[iLinha,  3]   := vPlano[j].NomePlano;
                           Planilha.TextRC[iLinha,  4]   := qryTipoContratoTCEDESCRICAO.AsString;
                           Planilha.TextRC[ilinha,  5]   := FieldByName('IDCONTRATOEMPTMO').AsString;
                           Planilha.NumberRC[ilinha,6]   := FieldByName('HMEVLRPREVISTO').AsCurrency;
                           Planilha.TextRC[ilinha,  7]   := FieldByName('HMEFORMACOBRANCA').AsString;
                           Inc(iLinha);
                           fTotal := fTotal + FieldByName('HMEVLRPREVISTO').AsCurrency;
                           Next;
                        end;
                       (* Grava na Planilha o total *)
                        Inc(iLinha);
                        Planilha.TextRC[ilinha, 1]   := 'Total de Quitações por Morte';
                        Planilha.NumberRC[ilinha,6]  := fTotal;
                        Inc(iLinha,2);
                        fTotal := 0;
                     end;
                     Close;
                  end;

                  Repaint;
                  Application.ProcessMessages;

                  qryTipoContrato.Next;
                  inc(i);

               end;
               EscondeFormProgresso;
            end;
         end;
      end;
   end;
   qryTipoContrato.Close;
end;



procedure TfrmConfereItensEnviados.FormShow(Sender: TObject);
begin
   inherited;

   (* preenche a data de lançamento e o ano de referência/competência *)
   pgcGeral.ActivePageIndex := 0;
   
   cboMes.ItemIndex        := DiasUteis.ExtraiMes(Date) - 1;
   DBspnAno.Value          := DiasUteis.ExtraiAno(Date);

   AbreQueries;

   (* Preenche a listbox de patrocinadoras... *)
   PreenchePatro;
   (* ...e marca todas por default *)
   MarcaTodosPatro;

   (* Preenche a listbox de Planos... *)
   PreenchePlano;
   (* ...e marca todos por default *)
   MarcaTodosPlano;
end;



procedure TfrmConfereItensEnviados.btnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   {* Marca todos os Patrocinadores *}
   MarcaCheckListBox(lstPatro);
   PreenchePatro;
end;



procedure TfrmConfereItensEnviados.btnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   {* Marca todos os Planos *}
   MarcaCheckListBox(lstPlano);
   PreenchePlano;
end;



procedure TfrmConfereItensEnviados.btnInvertePatroClick(Sender: TObject);
begin
   inherited;
   (* inverte a seleção patrocinador *)
   InverteChekListBox(lstPatro);
   PegaPatro;
end;



procedure TfrmConfereItensEnviados.btnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   (* inverte a seleção plano *)
   InverteChekListBox(lstPlano);
   PegaPlano;
end;



procedure TfrmConfereItensEnviados.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;

   // seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado
   with dtmLookEmptmo.qryLookTipoContrato do begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoContrato);

      if DBcboTipoEmptmo.LookupValue <> '' then begin
         ParamByName('PIDTIPOEMPTMO').AsInteger    := StrToInt(DBcboTipoEmptmo.LookupValue);
         ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
      end;

      Open;

      DBcboTipoContrato.Enabled := True;
   end;
end;

procedure TfrmConfereItensEnviados.lstPatroClickCheck(Sender: TObject);
begin
  inherited;
   PegaPatro;
end;

procedure TfrmConfereItensEnviados.lstPlanoClickCheck(Sender: TObject);
begin
  inherited;
   PegaPlano;
end;


procedure TfrmConfereItensEnviados.btnContinuarClick(Sender: TObject);
begin
  inherited;
   Planilha.ClearRange(-1, -1, -1, -1, F1ClearValues);
   MontaQuery;
   pgcGeral.ActivePageIndex := 1;
end;

procedure TfrmConfereItensEnviados.btnVoltarClick(Sender: TObject);
begin
  inherited;
   pgcGeral.ActivePageIndex := 0;
end;

end.
