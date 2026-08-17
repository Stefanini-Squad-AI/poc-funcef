unit FCadCRxTipoRecDes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, wwdblook, CMDBLookupCombo, Grids, Wwdbigrd, Wwdbgrid,
  CmEventosCadastro, ImgList;

type
  TfrmCadCRxTipoRecDes = class(TfrmCadastroCS)
    PnlCadastro: TPanel;
    GrdTipoDesembAssoc: TwwDBGrid;
    PnlTitTipoAgreAssoc: TPanel;
    PblRamoForn: TPanel;
    PnlCtrls: TPanel;
    BtnIncluiDesemb: TSpeedButton;
    BtnIncluiTodosDesemb: TSpeedButton;
    BtnExcluiDesembAssoc: TSpeedButton;
    BtnExcluiTodosDesembAssoc: TSpeedButton;
    PnlDesemb: TPanel;
    PnlTitDesemb: TPanel;
    GrdTipDesemb: TwwDBGrid;
    qryTiposRecDesemb: TwwQuery;
    rdgTiposRD: TRadioGroup;
    dsTiposRecDesemb: TwwDataSource;
    updTiposRecDesemb: TUpdateSQL;
    Label1: TLabel;
    edCentroRespon: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure BtnIncluiTodosDesembClick(Sender: TObject);
    procedure BtnExcluiTodosDesembAssocClick(Sender: TObject);
    procedure BtnIncluiDesembClick(Sender: TObject);
    procedure BtnExcluiDesembAssocClick(Sender: TObject);
    procedure rdgTiposRDClick(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroAtualizaBotoes(Sender: TObject);
  private
    { Private declarations }
    sCodCentroRespon : String;
    procedure InsereRecDesemb;
    procedure ExcluiRecDesemb;
  public
    { Public declarations }
  end;

var
  frmCadCRxTipoRecDes: TfrmCadCRxTipoRecDes;

implementation

{$R *.DFM}

Uses Usistema, uIntegraBack, uDataBase, uFuncaoGeral, ustring, fCadTipoDesemb,
     uMensErro;

procedure TfrmCadCRxTipoRecDes.FormCreate(Sender: TObject);
var
   qryAux : TwwQuery;
begin
   inherited;

   qryAux:=TwwQuery.Create(Self);
   try
      qryAux.DatabaseName:='BaseDados';
      qryAux.SQl.Text:='SELECT CR.CODCENTRORESPON, CR.NOME '+
                       'FROM CENTRESPON CR '+
                       'WHERE (CR.IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+')'+
                       'ORDER BY CR.NOME';
      qryAux.Open;
      qryAux.First;

      sCodCentroRespon:=qryAux.FieldByName('CODCENTRORESPON').AsString;
      edCentroRespon.Text:=qryAux.FieldByName('NOME').AsString;

      qryAux.Close;      
   finally
      qryAux.Free;
   end;

   MontaSelect.Filtro.Add('(CENTRESPON.IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+')');

   //
   qry.Close;
   qry.ParamByName('CentroRespon').AsString:=sCodCentroRespon;
   qry.ParamByName('IDPessoa').AsFloat:=Sistema.IdEmpresa;
   qry.Open;
   //
   qryTiposRecDesemb.Close;
   qryTiposRecDesemb.ParamByName('IDPessoa').AsFloat:=Sistema.IdEmpresa;
   qryTiposRecDesemb.ParamByName('RecPag').AsString:='T';
   qryTiposRecDesemb.ParamByName('CentroRespon').AsString:=sCodCentroRespon;
   qryTiposRecDesemb.Open;
end;

procedure TfrmCadCRxTipoRecDes.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
    begin
       sCodCentroRespon:=MontaSelect.ValoresChave[0];
       edCentroRespon.Text:=MontaSelect.ValoresChave[1];

       qry.Close;
       qry.ParamByName('CentroRespon').AsString:=sCodCentroRespon;
       qry.ParamByName('IDPessoa').AsFloat:=Sistema.IdEmpresa;
       qry.Open;

       qryTiposRecDesemb.Close;
       qryTiposRecDesemb.ParamByName('IDPessoa').AsFloat:=Sistema.IdEmpresa;
       qryTiposRecDesemb.ParamByName('CentroRespon').AsString:=sCodCentroRespon;
       qryTiposRecDesemb.ParamByName('RecPag').AsString:=Copy(rdgTiposRD.Items[rdgTiposRD.ItemIndex],1,1);
       qryTiposRecDesemb.Open;
    end;
end;

procedure TfrmCadCRxTipoRecDes.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
   inherited;
   sbtnAlterar.Enabled:=not(bbtnConfirmar.Enabled);
end;

procedure TfrmCadCRxTipoRecDes.InsereRecDesemb;
begin
   qry.Append;
   qry.FieldByName('RECPAG').AsString:=qryTiposRecDesemb.FieldByName('RECPAG').AsString;
   qry.FieldByName('IDPESSOA').AsFloat:=Sistema.IdEmpresa;
   qry.FieldByName('CODCENTRORESPON').AsString:=sCodCentroRespon;
   qry.FieldByName('CODTIPRECDES').AsString:=qryTiposRecDesemb.FieldByName('CODTIPRECDES').AsString;
   qry.FieldByName('DESCRICAO').AsString:=qryTiposRecDesemb.FieldByName('DESCRICAO').AsString;
   qryTiposRecDesemb.Delete;
   qry.Post;
end;

procedure TfrmCadCRxTipoRecDes.ExcluiRecDesemb;
begin
   qryTiposRecDesemb.Append;
   qryTiposRecDesemb.FieldByName('RECPAG').AsString:=qry.FieldByName('RECPAG').AsString;
   qryTiposRecDesemb.FieldByName('IDPESSOA').AsFloat:=Sistema.IdEmpresa;
   qryTiposRecDesemb.FieldByName('CODTIPRECDES').AsString:=qry.FieldByName('CODTIPRECDES').AsString;
   qryTiposRecDesemb.FieldByName('DESCRICAO').AsString:=qry.FieldByName('DESCRICAO').AsString;
   qry.Delete;
   qryTiposRecDesemb.Post;
end;

procedure TfrmCadCRxTipoRecDes.BtnIncluiTodosDesembClick(Sender: TObject);
begin
   inherited;
   if not qryTiposRecDesemb.IsEmpty then
   begin
      qryTiposRecDesemb.First;
      while not qryTiposRecDesemb.Eof do InsereRecDesemb;
   end;
end;

procedure TfrmCadCRxTipoRecDes.BtnExcluiTodosDesembAssocClick(
  Sender: TObject);
begin
   inherited;
   if not qry.IsEmpty then
   begin
      qry.First;
      while not qry.Eof do ExcluiRecDesemb;
   end;
end;

procedure TfrmCadCRxTipoRecDes.BtnIncluiDesembClick(Sender: TObject);
begin
   inherited;
   if not qryTiposRecDesemb.IsEmpty then InsereRecDesemb;
end;

procedure TfrmCadCRxTipoRecDes.BtnExcluiDesembAssocClick(Sender: TObject);
begin
  inherited;
  if not qry.IsEmpty then ExcluiRecDesemb;
end;

procedure TfrmCadCRxTipoRecDes.rdgTiposRDClick(Sender: TObject);
begin
   qryTiposRecDesemb.Close;
   qryTiposRecDesemb.ParamByName('IDPessoa').AsFloat:=Sistema.IdEmpresa;
   qryTiposRecDesemb.ParamByName('CentroRespon').AsString:=sCodCentroRespon;
   qryTiposRecDesemb.ParamByName('RecPag').AsString:=Copy(rdgTiposRD.Items[rdgTiposRD.ItemIndex],1,1);
   qryTiposRecDesemb.Open;
end;

end.

