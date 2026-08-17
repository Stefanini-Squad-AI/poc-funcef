{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Padrão      : 5.10.18 em diante...
Pendência   : 27508
Responsável : Daniel Simões
Data        : 17/03/2008
Descrição   : Ajuste dos Help Contexts...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit CRelListaContratos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, mProposta, mResponsavel, mComprador, mImovel,
  fcCombo, fcColorCombo, wwdbdatetimepicker, CMDateTimePicker, db,
  DBTables, Wwquery, wwdblook, mImovelMestre, mAdministradora, Mask,
  wwdbedit, Wwdotdot, Wwdbcomb;

type
  TRelListaContratos = class(TfrmOkCancelar)
    molProposta1: TmolProposta;
    molComprador1: TmolComprador;
    molResponsavel1: TmolResponsavel;
    GroupBox1: TGroupBox;
    cmdtFim: TCMDateTimePicker;
    rgOrdem: TRadioGroup;
    molImovel2: TmolImovel;
    cmdtIni: TCMDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    molImovelMestre1: TmolImovelMestre;
    GroupBox2: TGroupBox;
    cbProposta: TCheckBox;
    cbContrato: TCheckBox;
    molAdministradora1: TmolAdministradora;
    GroupBox3: TGroupBox;
    dbcbStatus: TwwDBComboBox;
    cbAcordo: TCheckBox;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure molProposta1btnBuscaPropClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelListaContratos: TRelListaContratos;

implementation

uses DRelFinanc, uFuncoesImob;

{$R *.DFM}


procedure TRelListaContratos.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   LimpaParametros(dtmRelFinanc.qryListaContratos);
   with dtmRelFinanc.qryListaContratos do begin
      if molProposta1.iProposta > 0 then
         ParamByName('pIDCONTRATOIMOVEL').AsFloat := molProposta1.iProposta;
      if molComprador1.iComprador > 0 then
         ParamByName('pIDCOMPRADOR').AsFloat := molComprador1.iComprador;
      if molResponsavel1.iResponsavel > 0 then
         ParamByName('pIDRESPONSAVEL').AsFloat := molResponsavel1.iResponsavel;
      if molAdministradora1.iAdministradora > 0 then
         ParamByName('pIDADMINIMOVEL').AsFloat := molAdministradora1.iAdministradora;
      if molImovelMestre1.iMestre > 0 then
         ParamByName('pIDIMOVELMESTRE').AsFloat := molImovelMestre1.iMestre;
      if molImovel2.iImovel > 0 then
         ParamByName('pIDIMOVEL').AsFloat := molImovel2.iImovel;
      if cmdtIni.Text <> '' then
         ParamByName('pDTINI').AsString := cmdtIni.Text;
      if cmdtFim.Text <> '' then
         ParamByName('pDTFIM').AsString := cmdtFim.Text;
      if cbProposta.Checked then ParamByName('pFLGPROPOSTA').AsString := 'S';
      if cbContrato.Checked then ParamByName('pFLGCONTRATO').AsString := 'S';
      if cbAcordo.Checked   then ParamByName('pFLGACORDO').AsString   := 'S';

      if dbcbStatus.ItemIndex > 0 then ParamByName('pFLGSTATUS').AsString := dbcbStatus.Value;  

      ParamByName('pORDEM').AsInteger := rgOrdem.ItemIndex;
      Open;
   end;
   dtmRelFinanc.qryListaCondPag.Open;

   if cbProposta.Checked and cbContrato.Checked then
      dtmRelFinanc.sTitulo := 'Relação de Propostas e Contratos de Alienação'
   else if cbProposta.Checked then
      dtmRelFinanc.sTitulo := 'Relação de Propostas de Alienação'
   else if cbContrato.Checked then
      dtmRelFinanc.sTitulo := 'Relação de Contratos de Alienação';
end;


procedure TRelListaContratos.molProposta1btnBuscaPropClick(Sender: TObject);
begin
   inherited;
   molProposta1.btnBuscaPropClick(3,False,Sender);
end;


procedure TRelListaContratos.FormShow(Sender: TObject);
begin
   inherited;
   cmDtFim.Date      := Date();
   rgOrdem.ItemIndex := 0;
end;

end.
