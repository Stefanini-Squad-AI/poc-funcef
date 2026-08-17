unit CRelQuitacaoComSaldoDevedor;

// Alterações:
{
 --------------------------------------------------------------------------------------------------
Pendência   : SOL 253185 PPM 771995
Responsável : William Moreira da Silva
Data        : 17/06/2015
Descrição   : Reestruturação da HistMovEmptmo(*Retirada dos Hint's)
--------------------------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CRel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
  TB97, ExtCtrls, mContratoEmptmo, Mask, wwdbedit, Wwdbspin, CheckLst,
  wwdblook, db, fcCombo, fcColorCombo, DBTables, Wwquery,

  uTypesEmptmo, mListaPlano, mListaPatro, wwdbdatetimepicker,
  CMDateTimePicker, mListaPlanoContab;

type
   TcfgRelQuitacaoComSaldoDevedor = class(TcfgRel)
      molContratoEmptmo: TmolContratoEmptmo;
      DBcboTipoContrato: TwwDBLookupCombo;
      Label2: TLabel;
      Label1: TLabel;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      GroupBox2: TGroupBox;
      chkCorLinha: TCheckBox;
      cboCorLinha: TfcColorCombo;
      chkLinhas: TCheckBox;
      molListaPatro: TmolListaPatro;
      GroupBox3: TGroupBox;
      Label5: TLabel;
      edtDataIni: TCMDateTimePicker;
      edtDataFim: TCMDateTimePicker;
      qryQuitacaoComSaldoDevedor: TwwQuery;
      qryQuitacaoComSaldoDevedorIDCONTRATOEMPTMO: TFloatField;
      qryQuitacaoComSaldoDevedorNOME: TStringField;
      qryQuitacaoComSaldoDevedorMATRICULA: TStringField;
      qryQuitacaoComSaldoDevedorHMEDATAPREVISTA: TDateTimeField;
      qryQuitacaoComSaldoDevedorSIT_CONTRATO: TStringField;
      qryQuitacaoComSaldoDevedorSALDODEV: TFloatField;
      qryQuitacaoComSaldoDevedorVALORDEV: TFloatField;
      qryTotalDebito: TwwQuery;
      qryTotalDebitoHMEVLRPREVISTO: TFloatField;
      molListaPlano: TmolListaPlanoContab;

      procedure FormShow(Sender: TObject);
      procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure molListaPatrobtnInvertePatroClick(Sender: TObject);
      procedure molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
      procedure molListaPlanobtnInvertePlanoClick(Sender: TObject);
      procedure molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
      procedure DBcboTipoEmptmoExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
    procedure molContratoEmptmobtnLimpaContratoClick(Sender: TObject);

   private { Private declarations }

      procedure AbreQueries;

      procedure MontaQuery; override;
      procedure FiltraRelatorio;

      //Pendência 27998
      function VerificaPreenchimentoDatas : Boolean;
      function VerificaPatro: Boolean;
      function VerificaPlano: Boolean;

  public { Public declarations }

  end;



var
  cfgRelQuitacaoComSaldoDevedor: TcfgRelQuitacaoComSaldoDevedor;



implementation
{$R *.DFM}
uses
   DLookEmptmo,
   UDiasUteis,
   USistema,
   UfuncoesEmptmo, dRelQuitacaoComSaldoDevedor,
   FProgresso,     (* FrmProgresso *)
   uMensErro,
   uCalcEmptmo,
   dAtualizacaoDiaria,
   dCalcEmptmo,
   dEmptmo,
   uVerificaPreenchimento;




procedure TcfgRelQuitacaoComSaldoDevedor.AbreQueries;
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



procedure TcfgRelQuitacaoComSaldoDevedor.MontaQuery;
var
   i           : Integer;
   dDataAtuDia : TDateTime;
   rSaldoDev   : TSaldoDevAnt;
   fDebitos    : Extended;
begin
   inherited;

   ParametrosSistema;
   with dtmRelQuitacaoComSaldoDevedor do
   begin
      bSeparador        := chkLinhas.Checked;
      bCorlinha         := chkCorLinha.Checked;
      CorLinha          := cboCorLinha.SelectedColor;
   end;

   FiltraRelatorio;

   dtmRelQuitacaoComSaldoDevedor.qryQuitacaoComSaldoDevedor.Close;
   dtmRelQuitacaoComSaldoDevedor.qryQuitacaoComSaldoDevedor.Open;

   qryQuitacaoComSaldoDevedor.First;

   frmProgresso.MostraFormProgresso('Verificando quitações com saldo devedor ou valores em aberto',True,True,True,0,qryQuitacaoComSaldoDevedor.RecordCount);

   i := 0;
   while not qryQuitacaoComSaldoDevedor.Eof do
   begin
       Inc(i);
       frmProgresso.AndaFormProgresso(i);

       if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
          dDataAtuDia := dtmAtualizacaoDiaria.UltimaAtuDia(qryQuitacaoComSaldoDevedorIDCONTRATOEMPTMO.AsFloat,
                                                           qryQuitacaoComSaldoDevedorHMEDATAPREVISTA.AsDateTime
                                                          )
       else
          dDataAtuDia := StrToDate('31/12/2150');                                                            

       rSaldoDev := CalcEmptmo.SaldoDevAnt(qryQuitacaoComSaldoDevedorIDCONTRATOEMPTMO.AsFloat,
                                           dDataAtuDia,
                                           -1,
                                           -1
                                          );

       LimpaParametros(qryTotalDebito);
       qryTotalDebito.ParamByName('PIDCONTRATOEMPTMO').AsFloat := qryQuitacaoComSaldoDevedorIDCONTRATOEMPTMO.AsFloat;
       qryTotalDebito.Open;

       if (rSaldoDev.fSaldoDevAnt <> 0) or (qryTotalDebito.FieldByName('HMEVLRPREVISTO').AsFloat <> 0) then
       begin
          dtmRelQuitacaoComSaldoDevedor.qryQuitacaoComSaldoDevedor.Append;
          dtmRelQuitacaoComSaldoDevedor.qryQuitacaoComSaldoDevedorIDCONTRATOEMPTMO.AsFloat   := qryQuitacaoComSaldoDevedorIDCONTRATOEMPTMO.AsFloat;
          dtmRelQuitacaoComSaldoDevedor.qryQuitacaoComSaldoDevedorNOME.AsString              := qryQuitacaoComSaldoDevedorNOME.AsString;
          dtmRelQuitacaoComSaldoDevedor.qryQuitacaoComSaldoDevedorMATRICULA.AsString         := qryQuitacaoComSaldoDevedorMATRICULA.AsString;
          dtmRelQuitacaoComSaldoDevedor.qryQuitacaoComSaldoDevedorHMEDATAPREVISTA.AsDateTime := qryQuitacaoComSaldoDevedorHMEDATAPREVISTA.AsDateTime;
          dtmRelQuitacaoComSaldoDevedor.qryQuitacaoComSaldoDevedorSIT_CONTRATO.AsString      := qryQuitacaoComSaldoDevedorSIT_CONTRATO.AsString;
          dtmRelQuitacaoComSaldoDevedor.qryQuitacaoComSaldoDevedorSALDODEV.AsFloat           := rSaldoDev.fSaldoDevAnt;
          dtmRelQuitacaoComSaldoDevedor.qryQuitacaoComSaldoDevedorVALORDEV.AsFloat           := qryTotalDebito.FieldByName('HMEVLRPREVISTO').AsFloat;
          dtmRelQuitacaoComSaldoDevedor.qryQuitacaoComSaldoDevedor.Post;
       end;
       qryQuitacaoComSaldoDevedor.Next;
   end;
   frmProgresso.EscondeFormProgresso;
   dtmRelQuitacaoComSaldoDevedor.qryQuitacaoComSaldoDevedor.First;
end;

procedure TcfgRelQuitacaoComSaldoDevedor.FiltraRelatorio;
var
   sSQL : String;
begin
   sSQL :=
   '  SELECT            '                                                               + #13 +
   '      HME.IDCONTRATOEMPTMO, '                                                       + #13 +
   '      PES.NOME, '                                                                   + #13 +
   '      DEP.MATRICULA, '                                                              + #13 +
   '      HME.HMEDATAPREVISTA, '                                                        + #13 +
   '      DECODE(CON.FLGSITUACAO, ''A'', ''Ativo'', '                                   + #13 +
   '                              ''E'', ''Encerrado'', '                               + #13 +
   '                              ''J'', ''Em Cobrança Jurídica'', '                    + #13 +
   '                              ''K'', ''Em Quitação'', '                             + #13 +
   '                              ''Q'', ''Quitado'', '                                 + #13 +
   '                              ''R'', ''Renovado'', '                                + #13 +
   '                              ''C'',''Cancelado'') AS SIT_CONTRATO, '               + #13 +
   '      0 AS SALDODEV, '                                                              + #13 +
   '      0 AS VALORDEV '                                                               + #13 +
   '  FROM '                                                                            + #13 +
   '      HISTMOVEMPTMO HME, '                                                          + #13 +
   '      CONTRATOEMPTMO CON, '                                                         + #13 +
   //Pendência 27205 - 09/01/2007
   '      TIPOCONTREMPTMO TCE, '                                                        + #13 +
   //Fim Pendência 27205
   '      DEPENTIT DEP, '                                                               + #13 +
   '      PESSOA PES, '                                                                  + #13 +

   // Pendência 23260 - Marcos Topini
   '   VWMIGRACONTRATOEP MIG '                                                                    + #13 +

   '  WHERE '                                                                           + #13 +
   '      CON.IDCONTRATOEMPTMO    = HME.IDCONTRATOEMPTMO '                              + #13 +
   '  AND HME.HMETIPOMOV          = 3 '                                                 + #13 +
   '  AND NVL(HME.FLGESTORNADO,0) = 0 '                                                 + #13 +
   '  AND (HME.HMECENTRALIZA = 1 OR HME.HMEDESTACADO = 1) '                             + #13 +
   '  AND DEP.IDTITULAR           = CON.IDPESSOA '                                      + #13 +
   '  AND DEP.IDPESSOA            = CON.IDBENEF '                                       + #13 +
   '  AND PES.IDPESSOA            = CON.IDBENEF '                                       + #13 +
   //Pendência 27205 - 09/01/2007
   '  AND CON.IDTIPOCONTREMPTMO   = TCE.IDTIPOCONTREMPTMO '                             + #13 +
   //Fim Pendência 27205

   // Pendência 23260 - Marcos Topini
   '  AND MIG.IDPATROATU           IN (' + molListaPatro.PegaPatro + ') '                 + #13 +
   '  AND MIG.IDPLANOCONTATU       IN (' + molListaPlano.PegaPlano + ') '                 + #13;

   if length(trim(edtDataIni.Text)) > 0 then sSQL := sSQL +
   '  AND HME.HMEDATAPREVISTA   >= ' + OraData(edtDataIni.Date)                         + #13;

   if length(trim(edtDataFim.Text)) > 0 then sSQL := sSQL +
   '  AND HME.HMEDATAPREVISTA   <= ' + OraData(edtDataFim.Date)                         + #13;

   //if molContratoEmptmo.IDContrato <> -1 then sSQL := sSQL +
   //'  AND CON.IDCONTRATOEMPTMO   = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)  + #13;

  //Pendência 27998
  if molContratoEmptmo.IDContrato <> -1 then
   begin
    sSQL := sSQL + '  AND HME.IDCONTRATOEMPTMO   = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)  + #13 +
    '                 AND CON.IDCONTRATOEMPTMO   = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)  + #13 +
    '                 AND MIG.IDCONTRATOEMPTMO   = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)  + #13;
   end;

   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   //Pendência 27205 - 09/01/2007
   //'  AND CON.IDTIPOEMPTMO       = ' + DBcboTipoEmptmo.LookupValue                      + #13;
   '  AND TCE.IDTIPOEMPTMO       = ' + DBcboTipoEmptmo.LookupValue                      + #13;
   //Fim Pendência 27205

   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '  AND CON.IDTIPOCONTREMPTMO  = ' + DBcboTipoContrato.LookupValue                    + #13;

// Pendência 23260 - Marcos Topini
//   sSQL := sSQL +
//   '  AND MIG.IDCONTRATOEMPTMO         = HME.IDCONTRATOEMPTMO '                                    + #13 +
//   '  AND MIG.DATAMIGRA                = (SELECT MAX(DATAMIGRA) '                                  + #13 +
//   '                                        FROM VWMIGRACONTRATOEP '                               + #13 +
//   '                                       WHERE IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO '         + #13 +
//   '                                         AND DATAMIGRA       <= HME.HMEDATAPREVISTA) '         + #13 ;

  //Pendência 27998
  sSQL := sSQL +
      'AND  MIG.IDCONTRATOEMPTMO         = HME.IDCONTRATOEMPTMO' + #13 +
      'AND  (MIG.IDCONTRATOEMPTMO, MIG.DATAMIGRA) IN (SELECT IDCONTRATOEMPTMO,MAX(DATAMIGRA)' + #13 +
      '                                                 FROM VWMIGRACONTRATOEP' + #13 +
      '                                                WHERE IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO' + #13 +
      '                                                  AND DATAMIGRA       <= HME.HMEDATAPREVISTA' + #13 +
      '                                             GROUP BY IDCONTRATOEMPTMO)' + #13;

   sSQL := sSQL +
   '  ORDER BY '                                                                        + #13 +
   '      HME.HMEDATAPREVISTA, HME.IDCONTRATOEMPTMO '                                   + #13;

   with qryQuitacaoComSaldoDevedor do
   begin
      Close;
      SQL.Text := sSQL;
      Open;
   end;
end;


procedure TcfgRelQuitacaoComSaldoDevedor.FormShow(Sender: TObject);
begin
   inherited;

   molContratoEmptmo.btnLimpaContrato.Click;

   AbreQueries;

   // Preenche a listbox de patrocinadoras...
   molListaPatro.PreenchePatro;
   // ...e marca todas por default
   molListaPatrobtnMarcaTodosPatroClick(self);

   // Preenche a listbox de Planos...
   molListaPlano.PreenchePlano;
   // ...e marca todos por default 
   molListaPlanobtnMarcaTodosPlanoClick(self);
end;



procedure TcfgRelQuitacaoComSaldoDevedor.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;

   // seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado
   with dtmLookEmptmo.qryLookTipoContr do begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoContr);

      if DBcboTipoEmptmo.LookupValue <> '' then begin
         ParamByName('PIDTIPOEMPTMO').AsInteger    := StrToInt(DBcboTipoEmptmo.LookupValue);
         ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
      end;

      Open;

      DBcboTipoContrato.Enabled := True;
   end;
end;



procedure TcfgRelQuitacaoComSaldoDevedor.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TcfgRelQuitacaoComSaldoDevedor.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TcfgRelQuitacaoComSaldoDevedor.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TcfgRelQuitacaoComSaldoDevedor.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



procedure TcfgRelQuitacaoComSaldoDevedor.DBcboTipoEmptmoExit(Sender: TObject);
begin
   inherited;

   // seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado
   with dtmLookEmptmo.qryLookTipoContr do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoContr);

      if DBcboTipoEmptmo.LookupValue <> '' then
      begin
         ParamByName('PIDTIPOEMPTMO').AsInteger    := StrToInt(DBcboTipoEmptmo.LookupValue);
         ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
      end;

      Open;

      DBcboTipoContrato.Enabled := True;
   end;
end;



function TcfgRelQuitacaoComSaldoDevedor.VerificaPatro: Boolean;
var
 i: Integer;
begin
  Result := False;

  try
    for i := 0 to molListaPlano.lstPlano.Items.Count -1 do
    begin
      if molListaPlano.lstPlano.Checked[i] then
        Result := True;
    end;

    if Result = false then
      raise EValidacao.createVal('No mínimo um dos Planos deve ser selecionado.', molListaPlano.lstPlano);

  except
    on E: EValidacao do
    begin
      Screen.Cursor := crDefault;
      if E.Show then
        MsgDlg(E.Message, 'Empréstimo', mtWarning, [mbOK], 0);
      Repaint;
      if E.Control.CanFocus then
         E.Control.SetFocus;
      Exit;
    end;
  end;

  Result := True;
end;

function TcfgRelQuitacaoComSaldoDevedor.VerificaPlano: Boolean;
var
  i: Integer;
begin
  Result := False;

  try
    for i := 0 to molListaPlano.lstPlano.Items.Count -1 do
    begin
      if molListaPlano.lstPlano.Checked[i] then
        Result := True;
    end;

    if Result = false then
      raise EValidacao.createVal('No mínimo um dos Planos deve ser selecionado.', molListaPlano.lstPlano);

  except
    on E: EValidacao do
    begin
      Screen.Cursor := crDefault;
      if E.Show then
        MsgDlg(E.Message, 'Empréstimo', mtWarning, [mbOK], 0);
      Repaint;
      if E.Control.CanFocus then
         E.Control.SetFocus;
      Exit;
    end;
  end;

  Result := True;

end;

function TcfgRelQuitacaoComSaldoDevedor.VerificaPreenchimentoDatas: Boolean;
begin
  Result := False;

  try
    if (Length(Trim(edtDataIni.Text)) = 0) and (molContratoEmptmo.IDContrato = -1) then
      raise EValidacao.createVal('É necessário indicar uma data inicial.', edtDataIni);

    if (Length(Trim(edtDataFim.Text)) = 0) and (molContratoEmptmo.IDContrato = -1) then
      raise EValidacao.createVal('é necessário indicar uma data final', edtDataFim);

  except
    on E: EValidacao do
    begin
      Screen.Cursor := crDefault;
      if E.Show then
        MsgDlg(E.message, 'Empréstimo', mtWarning, [mbOk], 0);
      Repaint;
      if E.Control.CanFocus then
         E.Control.SetFocus;
      Exit;
    end;
  end;

  Result := True;
end;

procedure TcfgRelQuitacaoComSaldoDevedor.bbtnConfirmarClick(
  Sender: TObject);
begin
  if (VerificaPreenchimentoDatas = True) and ((VerificaPatro = True) and (VerificaPlano  =  True)) then
    inherited;

end;

procedure TcfgRelQuitacaoComSaldoDevedor.molContratoEmptmobtnBuscaContratoClick(
  Sender: TObject);
begin
  inherited;
  molContratoEmptmo.btnBuscaContratoClick(Sender);
  if molContratoEmptmo.IDContrato <> -1 then
    DBcboTipoEmptmo.Enabled:= False;

end;

procedure TcfgRelQuitacaoComSaldoDevedor.molContratoEmptmobtnLimpaContratoClick(
  Sender: TObject);
begin
  inherited;
  molContratoEmptmo.btnLimpaContratoClick(Sender);
  DBcboTipoEmptmo.Enabled := True;
end;

end.
