{====>   DESENVOLVEDOR NÃO ESQUEÇA DE COMENTAR SUAS ALTERAÇÕES AO LONGO DO
         CÓDIGO, ASSIM COMO COLOCAR A DESCRIÇÃO DA IMPLEMENTAÇÃO/ALTERAÇÃO
         NO HISTÓRICO DE ALTERAÇÕES NO FINAL DESTE ARQUIVO ********************}
unit fParamRelBenefRetidos;

interface

uses
  Windows    , Messages, SysUtils, Classes , Graphics, Controls, Forms  , Dialogs,
  FOkCancelar, IvDictio, IvMulti , IvEMulti, MAHlpBtn, StdCtrls, Buttons, Spin   ,
  TB97Tlbr   , TB97    , ExtCtrls, Db      , DBTables, Wwquery , DBCtrls,
  checklst, wwdblook, usistema, dbasedados;

type
  TfrmParamRelBenefRetido = class(TfrmOkCancelar)
    qryPatrocinadora : TwwQuery;
    GroupBox2: TGroupBox;
    dbcmbPatrocinadora: TwwDBLookupCombo;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamRelBenefRetido : TfrmParamRelBenefRetido;

implementation

uses dRelBenefRetidos; 

{$R *.DFM}

procedure TfrmParamRelBenefRetido.FormCreate(Sender: TObject);
begin
  inherited;
  qryPatrocinadora.Open;

end;

procedure TfrmParamRelBenefRetido.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryPatrocinadora.Close;
  Action := caFree;
end;

procedure TfrmParamRelBenefRetido.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  dtmBaseDados.dbBaseDados.StartTransaction;
  if not Sistema.GravaLogOperacoes('Emissão: '+caption) then
    Raise Exception.Create('Não foi possível gravar o log.')
  else
    dtmBaseDados.dbBaseDados.Commit;

  If Trim(dbcmbPatrocinadora.Text) = '' Then
  Begin
    dtmRelBenefRetidos.qryBenefRetidos.Close;
    dtmRelBenefRetidos.qryBenefRetidos.ParamByName('PIDPESSJUR').AsString := '';
    dtmRelBenefRetidos.qryBenefRetidos.Open;
  End
  Else
  Begin
    dtmRelBenefRetidos.qryBenefRetidos.Close;
    dtmRelBenefRetidos.qryBenefRetidos.ParamByName('PIDPESSJUR').AsString := dbcmbPatrocinadora.LookupValue;
    dtmRelBenefRetidos.qryBenefRetidos.Open;
  End;
end;
end.
