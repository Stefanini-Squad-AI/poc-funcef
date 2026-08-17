unit FCadObjetoContratual;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, Mask, wwdbedit, DBCtrls, Wwdotdot, Wwdbcomb, wwdblook,
  CmEventosCadastro, ImgList;

type
  TfrmCadObjetoContratual = class(TfrmCadastroCS)
    Label1: TLabel;
    dbrdgrpTipo: TDBRadioGroup;
    Label2: TLabel;
    qryArtigo: TwwQuery;
    dbcmbArtigo: TwwDBLookupCombo;
    qryIDOBJETO: TFloatField;
    qryIDPESSOA: TFloatField;
    qryCODARTIGO: TStringField;
    qryNOMEOBJETO: TStringField;
    qryTIPOOBJETO: TStringField;
    memObj: TDBMemo;
    qryArtigoCODARTIGO: TStringField;
    qryArtigoDESCPROD: TStringField;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    procedure dbrdgrpTipoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadObjetoContratual: TfrmCadObjetoContratual;

implementation
uses uMensErro,UDatabase,usistema;
{$R *.DFM}

procedure TfrmCadObjetoContratual.CmeCadastroInsert(Sender: TObject);
begin
   inherited;
   qry.FieldByName('IDPESSOA').asinteger  := SISTEMA.idempresa;
   qry.FieldByName('TIPOOBJETO').asString := 'S';
   memObj.SetFocus;
end;

procedure TfrmCadObjetoContratual.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then begin
      qry.close;
      qry.ParamByName('IDOBJETO').AsInteger := strtoint(trim(MontaSelect.ValoresChave[0]));
      qry.open;

      if qry.FieldByName('TIPOOBJETO').AsString = 'M' then begin
         dbcmbArtigo.Enabled := true;
      end else begin
         dbcmbArtigo.Enabled := false;
      end;
   end;

end;
procedure TfrmCadObjetoContratual.bbtnConfirmarClick(Sender: TObject);
begin
   { Verificando se o Nome do Objeto Contratual foi preenchido. }
   if trim(qry.FieldByName('NOMEOBJETO').AsString) = '' then begin
      MsgDlg('Obrigatório preencher o nome do Serviço/Produto','Atenção',mtWarning,[mbOk],0);
      memObj.SetFocus;
      exit;
   end;
   if (dbrdgrpTipo.ItemIndex = 1) and (trim(qry.FieldByName('CODARTIGO').AsString) = '') then begin
      MsgDlg('Obrigatório preencher o Artigo para Serviço/Produto do tipo Mercadoria','Atenção',mtWarning,[mbOk],0);
      dbcmbArtigo.setfocus;
      exit;
   end;
   if qry.FieldByName('IDOBJETO').AsInteger <= 0 then
      qry.FieldByName('IDOBJETO').asinteger  := LeUltRegistro(NIL,'OBJETOCONTRATUAL');
   inherited;
end;

procedure TfrmCadObjetoContratual.FormActivate(Sender: TObject);
begin
   inherited;
   qry.close;
   qry.parambyname('IDOBJETO').AsInteger := 0;
   qry.open;
   qryArtigo.open;
   dbcmbArtigo.Enabled := false;

end;

procedure TfrmCadObjetoContratual.dbrdgrpTipoChange(Sender: TObject);
begin
  inherited;
  if dbrdgrpTipo.ItemIndex = 0 then begin
     dbcmbArtigo.Enabled := false;
  end else begin
     dbcmbArtigo.Enabled := true;
  end;
end;

end.
