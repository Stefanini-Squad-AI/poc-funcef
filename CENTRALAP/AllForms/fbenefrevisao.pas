unit FBenefRevisao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, ExtCtrls, DBCtrls, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, Db, DBTables, Wwquery, Wwdatsrc;

type
  TfrmBenefRevisao = class(TfrmOkCancelar)
    dsInserir: TwwDataSource;
    qryInserir: TwwQuery;
    rgrpBeneficiario: TRadioGroup;
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
    function SelBenefInserir(piNumeroProcesso, piIdTitular, piIdBeneficio : longint) : longint;
  end;

var
  frmBenefRevisao: TfrmBenefRevisao;

implementation

uses UMensErro;

{$R *.DFM}

function TfrmBenefRevisao.SelBenefInserir(piNumeroProcesso, piIdTitular, piIdBeneficio : longint) : longint;
begin
    Result := -1;
    qryInserir.Close;
    qryInserir.ParamByName('NumeroProcesso').AsInteger := piNumeroProcesso;
    qryInserir.ParamByName('IdTitular').AsInteger      := piIdTitular;
    qryInserir.ParamByName('IdBeneficio').AsInteger    := piIdBeneficio;
    qryInserir.Open;

    if qryInserir.IsEmpty
    then begin
       MsgDlg('Nenhum beneficiário foi encontrado.','Informação',mtInformation,[mbOk,mbHelp],0);
       Result := 0;
       Exit;
    end;

    rgrpBeneficiario.Items.Clear;
    qryInserir.First;
    while not qryInserir.Eof do
    begin
       rgrpBeneficiario.Items.Add(qryInserir.FieldByName('Nome').AsString);
       qryInserir.Next;
    end;

    ShowModal;

    if (ModalResult = mrOk) and (rgrpBeneficiario.ItemIndex >= 0)
    then begin
       if qryInserir.Locate('Nome',rgrpBeneficiario.Items[rgrpBeneficiario.ItemIndex],[loCaseInsensitive])
       then Result := qryInserir.FieldByName('IdPessoa').AsInteger
       else Result := -1;
    end
    else Result := -1;
end; //SelBenefInserir

end.
