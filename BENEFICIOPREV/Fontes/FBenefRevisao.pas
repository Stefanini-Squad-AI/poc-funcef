unit FBenefRevisao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, ExtCtrls, DBCtrls, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, Db, DBTables, Wwquery, Wwdatsrc,
  Grids, Wwdbigrd, Wwdbgrid;

type
  TfrmBenefRevisao = class(TfrmOkCancelar)
    dsInserir: TwwDataSource;
    qryInserir: TwwQuery;
    wwDBGrid1: TwwDBGrid;
    updInserir: TUpdateSQL;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    // Funcao     : SelBenefInserir
    // Descricao  : Exibe os beneficiarios cadastrados para um titular
    //              que ainda nao estejam no processo para um determinado
    //              beneficio
    // Parametros : piNumeroProcesso = numero do processo
    //              piIdTitular      = titular do processo
    //              piIdBeneficio    = codigo do beneficio
    // Resultado  : Retorna uma string com os Id's dos beneficiarios selecionados
    function SelBenefInserir(piNumeroProcesso, piIdTitular, piIdBeneficio : longint) : string;
  end;

var
  frmBenefRevisao: TfrmBenefRevisao;

implementation

uses UMensErro;

{$R *.DFM}

function TfrmBenefRevisao.SelBenefInserir(piNumeroProcesso, piIdTitular, piIdBeneficio : longint) : string;
begin
    Result := '';
    qryInserir.Close;
    qryInserir.ParamByName('NumeroProcesso').AsInteger := piNumeroProcesso;
    qryInserir.ParamByName('IdTitular').AsInteger      := piIdTitular;
    qryInserir.ParamByName('IdBeneficio').AsInteger    := piIdBeneficio;
    qryInserir.Open;

    if qryInserir.IsEmpty
    then begin
       MsgDlg('Nenhum beneficiário foi encontrado.','Informação',mtInformation,[mbOk,mbHelp],0);
       Result := '';
       Exit;
    end;

    ShowModal;

    // Verificar se algum beneficiario foi selecionado
    Result := '';
    if ModalResult <> mrOK then Exit;

    qryInserir.First;
    while not qryInserir.Eof do
    begin
       if Trim(Result) = ''
       then Result := qryInserir.FieldByName('IDPESSOA').AsString
       else Result := Result +','+ qryInserir.FieldByName('IDPESSOA').AsString;
    end;
end; //SelBenefInserir



procedure TfrmBenefRevisao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  inherited;
end;



end.