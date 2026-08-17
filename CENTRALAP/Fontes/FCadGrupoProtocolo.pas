unit FCadGrupoProtocolo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, Db, StdCtrls, Mask, wwdbedit, CmEventosCadastro, ImgList,
  Wwdatsrc, MontaSelect, DBTables, IvDictio, IvMulti, IvEMulti, Wwquery,
  MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, uDataBase;

type
  TfrmCadGrupoProtocolo = class(TfrmCadastroCS)
    Label1: TLabel;
    wwDBEdit1: TwwDBEdit;
    qryIDFIARASS: TFloatField;
    qryDESCRICAO: TStringField;
    qryDATAINCLUSAO: TDateTimeField;
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadGrupoProtocolo: TfrmCadGrupoProtocolo;

implementation

{$R *.DFM}

procedure TfrmCadGrupoProtocolo.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  qryIDFIARASS.asInteger := leUltRegistro(nil,'FiarioAssunto');
  qryDATAINCLUSAO.AsDateTime:= date;
end;

procedure TfrmCadGrupoProtocolo.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  qry.Close;
  if montaSelect.RetornouValor then
    qry.ParamByName('IDFIARASS').asInteger := strToIntDef(MontaSelect.ValoresChave[0], 0)
  else
    qry.ParamByName('IDFIARASS').asInteger := -1;
  qry.Open;
end;

procedure TfrmCadGrupoProtocolo.FormCreate(Sender: TObject);
begin
  inherited;
  qry.Close;
  qry.ParamByName('IDFIARASS').asInteger := -1;
  qry.Open;
end;

end.
