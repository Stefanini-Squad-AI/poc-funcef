{***************************************************************
 *
 * Unit Name: FCadItemContratual
 * Purpose  : Cadastro de Item Contratual
 * Author   : Gabriel W Farinas
 * History  : implementação em 18/08/99
 *
 ****************************************************************}

unit FCadItemContratual;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, DBCtrls, Mask, wwdbedit, CmEventosCadastro, ImgList;

type
  TfrmCadItemContratual = class(TfrmCadastroCS)
    Label1: TLabel;
    dbrdgrpTipoCobranca: TDBRadioGroup;
    qryIDITEM: TFloatField;
    qryIDPESSOA: TFloatField;
    qryNOME_ITEM: TStringField;
    qryTIPOCOBRANCA: TStringField;
    memItem: TDBMemo;
    procedure FormActivate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadItemContratual: TfrmCadItemContratual;

implementation
uses uMensErro,UDatabase,usistema;
{$R *.DFM}

procedure TfrmCadItemContratual.CmeCadastroInsert(Sender: TObject);
begin
   inherited;
   qry.FieldByName('IDPESSOA').asinteger   := SISTEMA.idempresa;
   qry.FieldByName('TIPOCOBRANCA').asString:= 'PS';
   memItem.SetFocus;
end;
procedure TfrmCadItemContratual.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then begin
      qry.close;
      qry.ParamByName('IDITEM').AsInteger := strtoint(trim(MontaSelect.ValoresChave[0]));
      qry.open;
   end;
end;

procedure TfrmCadItemContratual.FormActivate(Sender: TObject);
begin
  inherited;
  qry.close;
  qry.parambyname('IDITEM').AsInteger := 0;
  qry.open;
end;

procedure TfrmCadItemContratual.bbtnConfirmarClick(Sender: TObject);
begin
   { Verificando se o Nome do Item Contratual foi preenchido. }
   if trim(qry.FieldByName('NOME_ITEM').AsString) = '' then begin
      MsgDlg('Obrigatório preencher o nome do Item Contratual','Atenção',mtWarning,[mbOk],0);
      memItem.SetFocus;
      exit;
   end;
   if qry.FieldByName('IDITEM').asinteger <= 0 then
      qry.FieldByName('IDITEM').asinteger  := LeUltRegistro(NIL,'ITEMCONTRATUAL');
   inherited;
  
end;

end.
