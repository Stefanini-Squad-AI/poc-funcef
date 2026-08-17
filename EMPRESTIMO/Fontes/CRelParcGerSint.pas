unit CRelParcGerSint;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CRel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
  TB97, ExtCtrls, mContratoEmptmo, Mask, wwdbedit, Wwdbspin, CheckLst,
  wwdblook, db, fcCombo, fcColorCombo, mListaPlano, mListaPatro;

type
   TcfgRelParcGerSint = class(TcfgRel)
      molContratoEmptmo: TmolContratoEmptmo;
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
      molListaPatro: TmolListaPatro;
      molListaPlano: TmolListaPlano;

      procedure FormShow(Sender: TObject);
      procedure bbtnConfirmarClick(Sender: TObject);
      procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure molListaPatrobtnInvertePatroClick(Sender: TObject);
      procedure molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
      procedure molListaPlanobtnInvertePlanoClick(Sender: TObject);
      procedure molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
    procedure DBcboTipoEmptmoExit(Sender: TObject);


   private { Private declarations }

      function PegaAnoMes: String;

      (* Abre Querys de Tipo de Emprestimo e Tipo de Contrato *)
      procedure AbreQueries;

      (* Monta o select de contratos por faixa de meses, de acordo com a tela de params. *)
      function MontaSelectContrConc: String;

  public { Public declarations }

  end;



var
  cfgRelParcGerSint: TcfgRelParcGerSint;



implementation
{$R *.DFM}
uses
   DLookEmptmo,
   UDiasUteis,
   USistema,
   UfuncoesEmptmo, dRelParcGerSint,
   uMensErro;




function TcfgRelParcGerSint.PegaAnoMes: String;
var
   dData : TDateTime;
begin
   inherited;

   dData    := EncodeDate(word(trunc(DBspnAno.Value)), (cboMes.ItemIndex + 1), 1);
   Result   := FormatDateTime('YYYYMM', dData);
end;



procedure TcfgRelParcGerSint.AbreQueries;
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




procedure TcfgRelParcGerSint.FormShow(Sender: TObject);
begin
   inherited;

   molContratoEmptmo.btnLimpaContrato.Click;

   (* preenche a data de lançamento e o ano de referência/competência *)
   cboMes.ItemIndex        := DiasUteis.ExtraiMes(Date) - 1;
   DBspnAno.Value          := DiasUteis.ExtraiAno(Date);

   AbreQueries;

   (* Preenche a listbox de patrocinadoras... *)
   molListaPatro.PreenchePatro;
   (* ...e marca todas por default *)
   molListaPatrobtnMarcaTodosPatroClick(self);

   (* Preenche a listbox de Planos... *)
   molListaPlano.PreenchePlano;
   (* ...e marca todos por default *)
   molListaPlanobtnMarcaTodosPlanoClick(self);
end;



(* Monta o select de contratos por faixa de meses, de acordo com a tela de parametros. *)
function TcfgRelParcGerSint.MontaSelectContrConc: String;
var
   sSql           : String;
begin
   sSQL :=
    'SELECT TE.DESCTIPOEMPTMO,'                                                    + #13 +
    '       TCE.TCEDESCRICAO,'                                                     + #13 +
    '       PLA.NOME AS PLANO,'                                                    + #13 +
    '       PE.NOME AS PATRO,'                                                     + #13 +
    '       ITE.ITEDESCRICAO AS ITEM,'                                             + #13 +
    '       HST.HMECENTRALIZA,'                                                    + #13 +
    '       SUM(HST.HMEVLRPREVISTO) AS TOTAL,'                                     + #13 +
    '       DECODE(HMECENTRALIZA,1,COUNT(HST.IDCONTRATOEMPTMO),0) AS TOTCONTRATO,' + #13 +
    '       DECODE(HMECENTRALIZA,1,SUM(HST.HMEVLRPREVISTO),0) AS TOTALPARCELA'     + #13 +
    'FROM'                                                                         + #13 +
    '       HISTMOVEMPTMO HST,'                                                    + #13 +
    '       CONTRATOEMPTMO CTE,'                                                   + #13 +
    '       ITEMEMPTMO ITE,'                                                       + #13 +
    '       TIPOEMPTMO TE,'                                                        + #13 +
    '       TIPOCONTREMPTMO TCE,'                                                  + #13 +
    '       PLANPREV PLA,'                                                         + #13 +
    '       PATRO PAT,'                                                            + #13 +
    '       PESSOA PE'                                                             + #13 +
    'WHERE'                                                                        + #13 +
    '       TE.IDEMPRESAPROP       = ' + IntToStr(Sistema.IDEmpresa)               + #13 +
    'AND    CTE.IDPATRO           IN (' + molListaPatro.PegaPatro + ') '           + #13 +
    'AND    CTE.IDPLANOPREV       IN (' + molListaPlano.PegaPlano + ') '           + #13 +
    'AND    HST.HMEANOCOMPETENCIA = ' + NumeroIngles(DBspnAno.Value)               + #13 +
    'AND    HST.HMEMESCOMPETENCIA = ' + IntToStr(cboMes.ItemIndex + 1)             + #13;

   if DBcboTipoEmptmo.Text <> '' then
      sSQL := sSQL +
      'AND    TE.IDTIPOEMPTMO = ' + DBcboTipoEmptmo.LookupValue                    + #13;

   if DBcboTipoContrato.Text <> '' then
      sSQL := sSQL +
      'AND    TCE.IDTIPOCONTREMPTMO = ' + DBcboTipoContrato.LookupValue            + #13;

   sSQL := sSQL +
    'AND    (HST.IDCONTRATOEMPTMO = CTE.IDCONTRATOEMPTMO)'                         + #13 +
    'AND    (HST.IDITEMEMPTMO = ITE.IDITEMEMPTMO)'                                 + #13 +
    'AND    (HST.HMETIPOMOV = 1)'                                                  + #13 +
    'AND    (( HST.FLGESTORNADO IS NULL) OR (HST.FLGESTORNADO = 0))'               + #13 +
    'AND    (HST.HMESEQCOBRANCA = 1)'                                              + #13 +
    'AND    (CTE.IDPATRO = PAT.IDPESSOA)'                                          + #13 +
    'AND    (PE.IDPESSOA = PAT.IDPESSOA)'                                          + #13 +
    'AND    (CTE.IDPLANOPREV = PLA.IDPLANOPREV)'                                   + #13 +
    'AND    (CTE.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO)'                       + #13 +
    'AND    (TCE.IDTIPOEMPTMO = TE.IDTIPOEMPTMO)'                                  + #13 +
    'GROUP BY'                                                                     + #13 +
    '       PE.NOME,'                                                              + #13 +
    '       PLA.NOME,'                                                             + #13 +
    '       TE.DESCTIPOEMPTMO,'                                                    + #13 +
    '       TCE.TCEDESCRICAO,'                                                     + #13 +
    '       ITE.ITEDESCRICAO,'                                                     + #13 +
    '       HST.HMECENTRALIZA'                                                     + #13 +
    'ORDER BY '                                                                    + #13 +
    '         TE.DESCTIPOEMPTMO,'                                                  + #13 +
    '         TCE.TCEDESCRICAO,'                                                   + #13 +
    '         PLA.NOME,'                                                           + #13 +
    '         PE.NOME,'                                                            + #13 +
    '         HST.HMECENTRALIZA DESC,'                                             + #13 +
    '         ITE.ITEDESCRICAO DESC'                                               + #13;

   Result := sSql ;
end;




procedure TcfgRelParcGerSint.bbtnConfirmarClick(Sender: TObject);

var
   sSql            : String;
   idTipoContrato  : Integer;
begin
   idTipoContrato := -1;

   sSql := MontaSelectContrConc;

   dtmRelParcGerSint.MesCompetencia := cboMes.Text +' / '+ DBspnAno.Text;
   dtmRelParcGerSint.IsCorLinha     := chkCorLinha.Checked;
   dtmRelParcGerSint.CorLinha       := cboCorLinha.SelectedColor;

   dtmRelParcGerSint.qryParcGerSint.Close;
   dtmRelParcGerSint.qryParcGerSint.SQL.Clear;
   dtmRelParcGerSint.qryParcGerSint.SQL.Text := sSql;

   inherited;
end;



procedure TcfgRelParcGerSint.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
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



procedure TcfgRelParcGerSint.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TcfgRelParcGerSint.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TcfgRelParcGerSint.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TcfgRelParcGerSint.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



procedure TcfgRelParcGerSint.DBcboTipoEmptmoExit(Sender: TObject);
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



end.
