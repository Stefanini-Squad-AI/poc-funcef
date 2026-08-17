unit FPessoaBenefSeguro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fPessoa, ExtDlgs, Pessoa, Db, CmEventosCadastro, ImgList, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwdatsrc, Wwquery, MAHlpBtn,
  TB97Tlbr, Buttons, TB97Ctls, TB97, DBCtrls, StdCtrls, CheckLst, Grids,
  Wwdbigrd, Wwdbgrid, ComCtrls, CMDBLookupCombo, TREdit,
  wwdbdatetimepicker, CMDateTimePicker, Wwdbspin, wwdblook, ExtCtrls,
  TabControlDetalhe, wwdbedit, Mask;

type
  TfrmPessoaBenefSeguro = class(TfrmPessoa)
    qrySubTipoIDBENEFSEGURO: TFloatField;
    procedure CmeDetalheBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure chkTipoEnderecoClickCheck(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPessoaBenefSeguro: TfrmPessoaBenefSeguro;

implementation

uses UMensErro, FCadInscricao;

{$R *.DFM}



procedure TfrmPessoaBenefSeguro.CmeDetalheBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
   case pgctrlDetalhe.ActivePageIndex of

        1 {Endereços}   : begin
                             if dsEndereco.DataSet.IsEmpty then begin
                                MsgDlg('Favor Informar endereço !','Empréstimo',mtError,[mbOk],0);
                                Accept := False;
                             end;
                          end;

   end;
   inherited;

end;



procedure TfrmPessoaBenefSeguro.bbtnConfirmarClick(Sender: TObject);
var bOk : Boolean;
begin

   if dsEndereco.DataSet.IsEmpty then begin
      MsgDlg('Favor Informar endereço !','Empréstimo',mtError,[mbOk],0);
      bOk := False;
   end;

   if not bOk then Exit;
   CmeCadastro.RepetirInsert := False;
   frmCadInscricao.IDBenefSeguro    := qryIDPESSOA.AsInteger;
   frmCadInscricao.NomeBenefSeguro  := qryNOME.AsString;

   inherited;

   CmeCadastro.RepetirInsert := False;
   bbtnSairClick(Self);
end;



procedure TfrmPessoaBenefSeguro.chkTipoEnderecoClickCheck(Sender: TObject);
begin
  inherited;
   dsEndereco.DataSet.FieldByName('NOME').AsString := chkTipoEndereco.Items.Strings[chkTipoEndereco.ItemIndex] + ';';
end;



end.
