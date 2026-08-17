unit CRelItemAnalitico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CRel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
  TB97, ExtCtrls, mContratoEmptmo, Mask, wwdbedit, Wwdbspin, CheckLst,
  wwdblook, db, fcCombo, fcColorCombo, DBTables, Wwquery,

  uTypesEmptmo;

type
   TcfgRelItemAnalitico = class(TcfgRel)
      molContratoEmptmo: TmolContratoEmptmo;
      Label6: TLabel;
      lstPatro: TCheckListBox;
      btnInvertePatro: TBitBtn;
      btnMarcaTodosPatro: TBitBtn;
      lstPlano: TCheckListBox;
      Label7: TLabel;
      btnInvertePlano: TBitBtn;
      btnMarcaTodosPlano: TBitBtn;
      DBcboTipoContrato: TwwDBLookupCombo;
      Label2: TLabel;
      Panel1: TPanel;
      Label15: TLabel;
      DBspnAno: TwwDBSpinEdit;
      cboMes: TComboBox;
      Label1: TLabel;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      GroupBox2: TGroupBox;
      chkCorLinha: TCheckBox;
      cboCorLinha: TfcColorCombo;
      chkLinhas: TCheckBox;
      qryTipoContrato: TwwQuery;
      qryTipoContratoIDTIPOCONTREMPTMO: TFloatField;
      qryTipoContratoTCEDESCRICAO: TStringField;
      qrySaldoParc: TwwQuery;
    qrySaldoParcIDITEMEMPTMO: TFloatField;
    qrySaldoParcITEDESCRICAO: TStringField;
    qrySaldoParcVALOR: TFloatField;
    qrySaldoParcQUANT: TFloatField;
    qrySaldoParcIDTIPOCONTREMPTMO: TFloatField;
    qrySaldoParcHMECENTRALIZA: TStringField;
    qrySaldoParcITCTRATASALDODEV: TStringField;

      procedure FormShow(Sender: TObject);
      procedure btnMarcaTodosPatroClick(Sender: TObject);
      procedure btnMarcaTodosPlanoClick(Sender: TObject);
      procedure btnInvertePatroClick(Sender: TObject);
      procedure btnInvertePlanoClick(Sender: TObject);
      procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure lstPatroClickCheck(Sender: TObject);
      procedure lstPlanoClickCheck(Sender: TObject);


   private { Private declarations }

      vIDPatro, vIDPlano   : array of Int64;
      vPatro               : array of TPatro;
      vPlano               : array of TPlano;


      procedure PreenchePatro;
      procedure MarcaTodosPatro;
      function PegaPatro: String;

      procedure PreenchePlano;
      procedure MarcaTodosPlano;
      function PegaPlano: String;

      procedure AbreQueries;

      procedure MontaQuery; override;
      procedure FiltraRelatorio;

  public { Public declarations }

  end;



var
  cfgRelItemAnalitico: TcfgRelItemAnalitico;



implementation
{$R *.DFM}
uses
   DLookEmptmo,
   UDiasUteis,
   USistema,
   UfuncoesEmptmo, dRelItemAnalitico,
   FProgresso,     (* FrmProgresso *)
   uMensErro;




procedure TcfgRelItemAnalitico.PreenchePatro;
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



procedure TcfgRelItemAnalitico.MarcaTodosPatro;
var
   i : Integer;
begin
   // ...e marca todas por default
   for i := 0 to (lstPatro.Items.Count - 1) do lstPatro.Checked[i] := True;
end;



function TcfgRelItemAnalitico.PegaPatro: String;
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



procedure TcfgRelItemAnalitico.PreenchePlano;
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



procedure TcfgRelItemAnalitico.MarcaTodosPlano;
var
   i : Integer;
begin
   // ...e marca todas por default
   for i := 0 to (lstPlano.Items.Count - 1) do lstPlano.Checked[i] := True;
end;



function TcfgRelItemAnalitico.PegaPlano: String;
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



procedure TcfgRelItemAnalitico.AbreQueries;
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



procedure TcfgRelItemAnalitico.MontaQuery;
begin
   inherited;

   with dtmRelItemAnalitico do begin

      sMesCompetencia := cboMes.Text + ' / ' + DBspnAno.Text;
      bCorLinha       := chkCorLinha.Checked;
      CorLinha        := cboCorLinha.SelectedColor;

   end;

   FiltraRelatorio;
end;



procedure TcfgRelItemAnalitico.FiltraRelatorio;
var
   i : Integer;
begin
   (* monta a forma de cobrança ------------------------------------------------------------------- *)

   with dtmRelItemAnalitico do begin

      sMesCompetencia := cboMes.Text + ' / ' + DBspnAno.Text;
      bCorLinha       := chkCorLinha.Checked;
      CorLinha        := cboCorLinha.SelectedColor;

   end;

   with dtmRelItemAnalitico.qrySaldoParcelas do begin
      Close;
      Open;
   end;

   qryTipoContrato.Sql.Clear;
   qryTipoContrato.Sql.Add('SELECT IDTIPOCONTREMPTMO, TCEDESCRICAO');
   qryTipoContrato.Sql.Add('FROM TIPOCONTREMPTMO');
   if DBcboTipoContrato.Text <> '' then
      qryTipoContrato.Sql.Add('WHERE IDTIPOCONTREMPTMO = ' + DBcboTipoContrato.LookupValue);
   qryTipoContrato.Sql.Add('ORDER BY TCEDESCRICAO');
   qryTipoContrato.Open;


//   for k := 0 to High(vPatro) do begin

//      if vPatro[k].FlgMarcado then begin
//         for j := 0 to High(vPlano) do begin

//            if vPlano[j].FlgMarcado then begin
               qryTipoContrato.First;

               MostraFormProgresso('Gerando informações...', 0, qryTipoContrato.RecordCount, True, True);
               i := 0;

               while not qryTipoContrato.Eof do begin

                  (* Atualizando a Barra de Progresso *)
                  AndaFormProgresso(i);

                  (* Verifica se o usuário Cancelou a Operação *)
                  if frmProgresso.Cancelou then Exit;

                  (* Busca Concessões *)
                  with qrySaldoParc do begin
                     LimpaParametros(qrySaldoParc);

                     ParamByName('PHMEANOCOMPETENCIA').AsInteger  := trunc(DBspnAno.Value);
                     ParamByName('PHMEMESCOMPETENCIA').AsInteger  := cboMes.ItemIndex + 1;
//                     ParamByName('PIDPATRO').AsInteger            := vPatro[k].IDPatro;
//                     ParamByName('PIDPLANOPREV').AsInteger        := vPlano[j].IDPlano;
                     ParamByName('PIDTIPOCONTREMPTMO').AsInteger  := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                     ParamByName('PIDEMPRESAPROP').AsInteger      := Sistema.IDEmpresa;
                     if molContratoEmptmo.IDContrato <> -1 then
                        ParamByName('PIDCONTRATOEMPTMO').AsInteger := molContratoEmptmo.IDContrato;
                     Open;
                     while not eof do begin
                        (* Grava na Tabela Virtual *)
                        with dtmRelItemAnalitico do begin
                           qrySaldoParcelas.Append;

//                           qrySaldoParcelasIDPATRO.AsInteger            := vPatro[k].IDPatro;
//                           qrySaldoParcelasNOMEPATRO.AsString           := vPatro[k].NomePatro;
//                           qrySaldoParcelasIDPLANOPREV.ASInteger        := vPlano[j].IdPlano;
//                           qrySaldoParcelasDESCPLANO.AsString           := vPlano[j].NomePlano;
                           qrySaldoParcelasIDTIPOCONTREMPTMO.AsInteger  := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;
                           qrySaldoParcelasTCEDESCRICAO.AsString        := qryTipoContratoTCEDESCRICAO.AsString;
                           qrySaldoParcelasITEDESCRICAO.AsString        := qrySaldoParcITEDESCRICAO.AsString;
                           qrySaldoParcelasAFETASALDO.AsString          := qrySaldoParcITCTRATASALDODEV.AsString;
                           qrySaldoParcelasCENTRALIZADOR.AsString       := qrySaldoParcHMECENTRALIZA.AsString;
                           qrySaldoParcelasIDITEMEMPTMO.AsInteger       := qrySaldoParcIDITEMEMPTMO.AsInteger;
                           qrySaldoParcelasVALOR.AsCurrency             := qrySaldoParcVALOR.AsCurrency;
                           qrySaldoParcelasQUANT.AsInteger              := qrySaldoParcQUANT.AsInteger;

                           qrySaldoParcelas.Post;
                        end;

                        Next;
                     end;
                     Close;
                  end;

                  qryTipoContrato.Next;
                  inc(i);

               end;
               EscondeFormProgresso;
//            end;
//         end;
//      end;
//   end;

   dtmRelItemAnalitico.qrySaldoParcelas.First;
   qryTipoContrato.Close;
end;



procedure TcfgRelItemAnalitico.FormShow(Sender: TObject);
begin
   inherited;

   molContratoEmptmo.btnLimpaContrato.Click;

   (* preenche a data de lançamento e o ano de referência/competência *)
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



procedure TcfgRelItemAnalitico.btnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   {* Marca todos os Patrocinadores *}
   MarcaCheckListBox(lstPatro);
   PreenchePatro;
end;



procedure TcfgRelItemAnalitico.btnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   {* Marca todos os Planos *}
   MarcaCheckListBox(lstPlano);
   PreenchePlano;
end;



procedure TcfgRelItemAnalitico.btnInvertePatroClick(Sender: TObject);
begin
   inherited;
   (* inverte a seleção patrocinador *)
   InverteChekListBox(lstPatro);
   PegaPatro;
end;



procedure TcfgRelItemAnalitico.btnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   (* inverte a seleção plano *)
   InverteChekListBox(lstPlano);
   PegaPlano;
end;



procedure TcfgRelItemAnalitico.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
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



procedure TcfgRelItemAnalitico.lstPatroClickCheck(Sender: TObject);
begin
  inherited;
   PegaPatro;
end;

procedure TcfgRelItemAnalitico.lstPlanoClickCheck(Sender: TObject);
begin
  inherited;
   PegaPlano;
end;

end.


