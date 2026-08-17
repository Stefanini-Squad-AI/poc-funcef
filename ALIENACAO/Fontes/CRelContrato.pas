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

unit CRelContrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, mProposta, mResponsavel, mComprador, mImovel,
  mImovelMestre;

type
  TRelContrato = class(TfrmOkCancelar)
    molProposta1: TmolProposta;
    molComprador1: TmolComprador;
    molResponsavel1: TmolResponsavel;
    molImovelMestre1: TmolImovelMestre;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure molProposta1btnBuscaPropClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelContrato: TRelContrato;

implementation

uses DRelFinanc, uFuncoesImob;

{$R *.DFM}

procedure TRelContrato.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  LimpaParametros(dtmRelFinanc.qryContrato);
  with dtmRelFinanc.qryContrato do begin
     if molProposta1.iProposta > 0 then
        ParamByName('pIDCONTRATOIMOVEL').AsFloat := molProposta1.iProposta;
     if molComprador1.iComprador > 0 then
        ParamByName('pIDCOMPRADOR').AsFloat := molComprador1.iComprador;
     if molResponsavel1.iResponsavel > 0 then
        ParamByName('pIDRESPONSAVEL').AsFloat := molResponsavel1.iResponsavel;
     if molImovelMestre1.iMestre > 0 then
        ParamByName('pIDIMOVEL').AsFloat := molImovelMestre1.iMestre;
     Open;
  end;
  dtmRelFinanc.qryCondPag.Open;
end;

procedure TRelContrato.molProposta1btnBuscaPropClick(Sender: TObject);
begin
   inherited;
   molProposta1.btnBuscaPropClick(2,false,Sender);
end;

end.
