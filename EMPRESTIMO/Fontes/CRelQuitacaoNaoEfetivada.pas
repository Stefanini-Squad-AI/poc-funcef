{---------------------------Alteração-------------------------------------------
Pendência   : SOL 114575 KINTANA 535771
Responsável : Jéssica Lana
Data        : 24/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
-------------------------------------------------------------------------------}
unit CRelQuitacaoNaoEfetivada;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CRel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
  TB97, ExtCtrls, mContratoEmptmo, Mask, wwdbedit, Wwdbspin, CheckLst,
  wwdblook, db, fcCombo, fcColorCombo, DBTables, Wwquery,

  uTypesEmptmo, mListaPlano, mListaPatro, wwdbdatetimepicker,
  CMDateTimePicker;

type
   TcfgRelQuitacaoNaoEfetivada = class(TcfgRel)
      molContratoEmptmo: TmolContratoEmptmo;
      DBcboTipoContrato: TwwDBLookupCombo;
      Label2: TLabel;
      Label1: TLabel;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      GroupBox2: TGroupBox;
      chkCorLinha: TCheckBox;
      cboCorLinha: TfcColorCombo;
      chkLinhas: TCheckBox;
      qryTipoContrato: TwwQuery;
      qryTipoContratoIDTIPOCONTREMPTMO: TFloatField;
      qryTipoContratoTCEDESCRICAO: TStringField;
      molListaPatro: TmolListaPatro;
      molListaPlano: TmolListaPlano;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    edtDataIni: TCMDateTimePicker;
    edtDataFim: TCMDateTimePicker;

      procedure FormShow(Sender: TObject);
      procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure molListaPatrobtnInvertePatroClick(Sender: TObject);
      procedure molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
      procedure molListaPlanobtnInvertePlanoClick(Sender: TObject);
      procedure molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
    procedure DBcboTipoEmptmoExit(Sender: TObject);


   private { Private declarations }

      procedure AbreQueries;

      procedure MontaQuery; override;
      procedure FiltraRelatorio;

  public { Public declarations }

  end;



var
  cfgRelQuitacaoNaoEfetivada: TcfgRelQuitacaoNaoEfetivada;



implementation
{$R *.DFM}
uses
   DLookEmptmo,
   UDiasUteis,
   USistema,
   UfuncoesEmptmo, dRelQuitacaoNaoEfetivada,
   FProgresso,     (* FrmProgresso *)
   uMensErro;




procedure TcfgRelQuitacaoNaoEfetivada.AbreQueries;
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



procedure TcfgRelQuitacaoNaoEfetivada.MontaQuery;
begin
   inherited;

   with dtmRelQuitacaoNaoEfetivada do
   begin
      bSeparador        := chkLinhas.Checked;
      bCorlinha         := chkCorLinha.Checked;
      CorLinha          := cboCorLinha.SelectedColor;

      // Início Pendência 21063 - Marcos Ventura Topini
      // -------------------------------------------------------------------------------------------

        lblTipoEmptmo.Caption := ' < todos > ';
        if DBcboTipoEmptmo.LookupValue <> ''   then lblTipoEmptmo.Caption := DBcboTipoEmptmo.Text;

        lblTipoContr.Caption  := ' < todos > ';
        if DBcboTipoContrato.LookupValue <> ''    then lblTipoContr.Caption  := DBcboTipoContrato.Text;

        memPatro.RichText := molListaPatro.ListaPatro;
        memPlano.RichText := molListaPlano.ListaPlano;

      // -------------------------------------------------------------------------------------------
      // Fim Pendência 21063

   end;
   FiltraRelatorio;
end;

procedure TcfgRelQuitacaoNaoEfetivada.FiltraRelatorio;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT DISTINCT '                                                                     + #13 +
   '  CON.TCEDESCRICAO, '                                                                 + #13 +
   '  CON.IDCONTRATOEMPTMO, '                                                             + #13 +
   '  CON.INSCRICAONUMERO, '                                                              + #13 +
   '  CON.MATRICULA, '                                                                    + #13 +
   '  CON.NOME, '                                                                         + #13 +
   '  CON.SITDESCRICAO, '                                                                 + #13 +
   '  HME.HMEVLRPREVISTO, '                                                               + #13 +
   '  HME.HMEPARCELA, '                                                                   + #13 +
   '  HME.HMEDATAVENCTO AS HMEDATAPREVISTA'                                               + #13 +
   'FROM '                                                                                + #13 +
   '  HISTMOVEMPTMO HME, '                                                                + #13 +
   '  VWCONTRATOEP  CON, '                                                                + #13 +

   // Pendência 23260 - Marcos Topini
   '   VWMIGRACONTRATOEP MIG '                                                            + #13 +

   'WHERE '                                                                               + #13 +
   '      CON.IDEMPRESAPROP      = ' + IntToStr(Sistema.IDEmpresa)                        + #13 +
   '  AND HME.HMETIPOMOV         = 3 '                                                    + #13 +
   '  AND HME.HMEORIGEM          <> 8 '                                                   + #13 +
   '  AND HME.HMECENTRALIZA      = 1 '                                                    + #13 +
   '  AND ( HME.FLGBAIXADO       = 0 OR HME.HMEVLREFETIVO IS NULL ) '                     + #13 +
   '  AND ( HME.FLGESTORNADO     = 0 OR HME.FLGESTORNADO IS NULL ) '                      + #13 +

   // Pendência 23260 - Marcos Topini
   '  AND MIG.IDPATROATU           IN (' + molListaPatro.PegaPatro + ') '                 + #13 +
   '  AND MIG.IDPLANOCONTATU       IN (' + molListaPlano.PegaPlano + ') '                 + #13;

   if molContratoEmptmo.IDContrato <> -1 then sSQL := sSQL +
   '  AND CON.IDCONTRATOEMPTMO   = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)    + #13;

   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '  AND CON.IDTIPOEMPTMO       = ' + DBcboTipoEmptmo.LookupValue                        + #13;

   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '  AND CON.IDTIPOCONTREMPTMO  = ' + DBcboTipoContrato.LookupValue                      + #13;

   if length(trim(edtDataIni.Text)) > 0 then sSQL := sSQL +
   '  AND HME.HMEDATAPREVISTA   >= ' + OraData(edtDataIni.Date)                           + #13;

   if length(trim(edtDataFim.Text)) > 0 then sSQL := sSQL +
   '  AND HME.HMEDATAPREVISTA   <= ' + OraData(edtDataFim.Date)                           + #13;

   sSql := sSql +
   '  AND CON.IDCONTRATOEMPTMO   = HME.IDCONTRATOEMPTMO '                                 + #13 +

   // Pendência 23260 - Marcos Topini
   '  AND MIG.IDCONTRATOEMPTMO         = HME.IDCONTRATOEMPTMO '                            + #13 +
   '  AND MIG.DATAMIGRA                = (SELECT MAX(DATAMIGRA) '                          + #13 +
   '                                        FROM VWMIGRACONTRATOEP '                       + #13 +
   '                                       WHERE IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO ' + #13 +
   '                                         AND DATAMIGRA       <= HME.HMEDATAPREVISTA) ' + #13 +

   'ORDER BY '                                                                            + #13 +
   '  CON.TCEDESCRICAO, HME.HMEDATAVENCTO, CON.NOME ';


   with dtmRelQuitacaoNaoEfetivada.qryQuitacaoNaoEfetivada do
   begin
      Close;
      SQL.Text := sSQL;
    //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
    //SQL.SaveToFile(Sistema.TempDir + 'RelQuitacaoNaoEfetivada.txt');
      SQL.SaveToFile(ftempregra + '\' + 'RelQuitacaoNaoEfetivada.txt');
      Open;
   end;
end;


procedure TcfgRelQuitacaoNaoEfetivada.FormShow(Sender: TObject);
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



procedure TcfgRelQuitacaoNaoEfetivada.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
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



procedure TcfgRelQuitacaoNaoEfetivada.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TcfgRelQuitacaoNaoEfetivada.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TcfgRelQuitacaoNaoEfetivada.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TcfgRelQuitacaoNaoEfetivada.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



procedure TcfgRelQuitacaoNaoEfetivada.DBcboTipoEmptmoExit(Sender: TObject);
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
