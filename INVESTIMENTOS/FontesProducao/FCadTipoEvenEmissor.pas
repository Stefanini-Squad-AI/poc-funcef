unit FCadTipoEvenEmissor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, Mask, wwdbedit, TB97Ctls, TB97Tlbr,
  CmEventosCadastro, ImgList, IvDictio, IvMulti, IvEMulti, FCadastroCSInv,
  fcLabel;

type
  TfrmCadTipoEvenEmissor = class(TfrmCadastroCSInv)
    Label2: TLabel;
    dbeDescEventoEmissor: TwwDBEdit;
    procedure bbtnConfirmarClick(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadTipoEvenEmissor: TfrmCadTipoEvenEmissor;

implementation
Uses
  UmensErro, UDataBase ;

{$R *.DFM}

procedure TfrmCadTipoEvenEmissor.CmeCadastroInsert(Sender: TObject);
var
   sSql : string ;
begin
   qry.Close;
   qry.Sql.Clear;
   sSql := 'select TEE.IdTipoEvenEmissor,TEE.DescTpEvenEmissor from TipoEvenEmissor TEE ';
   sSql := sSql + ' where 1 = 2 ';
   qry.SQL.Add(sSQL);
   qry.Open;
   inherited;
end;

procedure TfrmCadTipoEvenEmissor.CmeCadastroFind(Sender: TObject);
var
   sSql : string ;
begin
   if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '') then
   begin
      qry.Close;
      qry.Sql.Clear;
      sSql := 'select TEE.IdTipoEvenEmissor, TEE.DescTpEvenEmissor From TipoEvenEmissor TEE';
      sSql := sSql + ' where TEE.IdTipoEvenEmissor = '''+ MontaSelect.ValoresChave[0] + '''';
      qry.SQL.Add(sSQL);
      qry.Open;
   end;
   inherited;
end;

procedure TfrmCadTipoEvenEmissor.bbtnConfirmarClick(Sender: TObject);
begin
   if Trim(dbeDescEventoEmissor.Text) = '' then
   Begin
      MsgDlg('Descrição do Evento  deve ser informado. ','Erro',mtError,[mbOK],0);
      dbeDescEventoEmissor.SetFocus;
      exit;
   End
   else
   if ds.DataSet.State in [dsInsert] then
      if qry.FieldByName('IDTIPOEVENEMISSOR').AsInteger <=0 then
         qry.FieldByName('IDTIPOEVENEMISSOR').AsInteger := LeUltRegistro(nil,'TIPOEVENEMISSOR');
   inherited;
end;


end.
