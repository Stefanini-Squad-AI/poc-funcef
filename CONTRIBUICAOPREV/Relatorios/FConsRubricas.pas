// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 25.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
unit FConsRubricas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, MontaSelect, ComCtrls,
  Grids, Wwdbigrd, Wwdbgrid, Wwdatsrc, Mask, wwdbedit;

type
  TfrmConsRubricas = class(TfrmSairAjuda)
    Label1: TLabel;
    Label2: TLabel;
    pgctrlRubricaXPess: TPageControl;
    tbsRubricaxPESS: TTabSheet;
    bbtnProcFuncao: TBitBtn;
    MontaSelect: TMontaSelect;
    qryProvDesc: TwwQuery;
    qryRubricaXPess: TwwQuery;
    wwDBEdit1: TwwDBEdit;
    wwDBEdit2: TwwDBEdit;
    dsProvDesc: TwwDataSource;
    dsRubricaxPESS: TwwDataSource;
    wwDBGrid1: TwwDBGrid;
    procedure bbtnProcFuncaoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    function AbreConsultaRubricas ( piIdRubrica : integer ) : boolean;
  public
    { Public declarations }
  end;

var
  frmConsRubricas: TfrmConsRubricas;

implementation

uses UAdmPrev;

{$R *.DFM}

function TfrmConsRubricas.AbreConsultaRubricas ( piIdRubrica : integer ) : boolean;
begin
   Result := False;

   with qryProvDesc do
   begin
      Close;
      ParamByName('IDPROVENTO').AsInteger := piIdRubrica;
      Open;
   end;
   with qryRubricaxPess do
   begin
      Close;
      ParamByName('IDPROVENTO').AsInteger := piIdRubrica;
      Open;
   end;
   Result := True;
end;

procedure TfrmConsRubricas.bbtnProcFuncaoClick(Sender: TObject);
begin
  inherited;
  MontaSelect.Executar;
  if not MontaSelect.RetornouValor
  then AbreConsultaRubricas(-1)
  else AbreConsultaRubricas(StrToInt(MontaSelect.ValoresChave[0]));
end;

procedure TfrmConsRubricas.FormShow(Sender: TObject);
begin
  inherited;
  AbreConsultaRubricas(-1);
  MontaSelect.Filtro.Add('RUBRICAXPESS.IDPESSOA IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')'); 
end;

end.
