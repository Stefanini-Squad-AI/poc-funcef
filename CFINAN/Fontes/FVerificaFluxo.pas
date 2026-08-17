unit FVerificaFluxo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Db, DBTables,
  Wwquery;

type
  TfrmVerificaFluxo = class(TfrmOkCancelar)
    Panel1: TPanel;
    dbgdTipoRecDes: TwwDBGrid;
    dsTipoRecdes: TDataSource;
    qryTipoRecDes: TwwQuery;
    qryTipoRecDesSELECIONADO: TStringField;
    qryTipoRecDesCODTIPRECDES: TStringField;
    qryTipoRecDesDESCRICAO: TStringField;
    qryTipoRecDesRECPAG: TStringField;
    updTipoRecDes: TUpdateSQL;
    Panel2: TPanel;
    rgModoInclusao: TRadioGroup;
    rgTipo: TRadioGroup;
    rgFaltantes: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure qryTipoRecDesSELECIONADOChange(Sender: TField);
    procedure FormShow(Sender: TObject);
    procedure rgTipoClick(Sender: TObject);
    procedure rgFaltantesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sTipo        : String;
    iNumMarcados : Integer;
  end;

var
  frmVerificaFluxo: TfrmVerificaFluxo;

implementation

{$R *.DFM}

uses uMensErro,uSistema;

procedure TfrmVerificaFluxo.FormCreate(Sender: TObject);
begin
   iNumMarcados:=0;
   sTipo:='';
end;

procedure TfrmVerificaFluxo.FormShow(Sender: TObject);
begin
   inherited;
   qryTipoRecDes.Close;
   qryTipoRecDes.ParamByName('IDPessoa').AsFloat:=Sistema.IdEmpresa;
   if rgTipo.ItemIndex=0 then
      qryTipoRecDes.ParamByName('Tipo').AsString:='A'
   else
      qryTipoRecDes.ParamByName('Tipo').AsString:='S';
   qryTipoRecDes.Open;
end;

procedure TfrmVerificaFluxo.qryTipoRecDesSELECIONADOChange(Sender: TField);
begin
   if (qryTipoRecDes.FieldByName('SELECIONADO').AsString='S') and
      (qryTipoRecDes.FieldByName('RECPAG').AsString<>sTipo) and
      (sTipo<>'') then
    begin
       Inc(iNumMarcados);
       qryTipoRecDes.Edit;
       qryTipoRecDes.FieldByName('SELECIONADO').AsString:='N';
       qryTipoRecDes.Post;
       MsgDlg('Não é permitido Selecionar Recebimentos e Desembolsos '+#10+#13+
              'ao mesmo tempo.','Erro',mtError,[mbOk],0);
       Exit;
    end;

   if (qryTipoRecDes.FieldByName('SELECIONADO').AsString='S') then
      Inc(iNumMarcados)
   else
      Dec(iNumMarcados);

   if sTipo='' then  sTipo:=qryTipoRecDes.FieldByName('RECPAG').AsString;
   if iNumMarcados=0 then sTipo:='';
end;

procedure TfrmVerificaFluxo.rgTipoClick(Sender: TObject);
begin
   qryTipoRecDes.Close;
   qryTipoRecDes.ParamByName('IDPessoa').AsFloat:=Sistema.IdEmpresa;
   if rgTipo.ItemIndex=0 then
      qryTipoRecDes.ParamByName('Tipo').AsString:='A'
   else
      qryTipoRecDes.ParamByName('Tipo').AsString:='S';
   qryTipoRecDes.Open;
end;

procedure TfrmVerificaFluxo.rgFaltantesClick(Sender: TObject);
begin
   case rgFaltantes.ItemIndex of
      0: rgFaltantes.Caption:='Tipos de Recebimento/Desembolso que ainda não fazem parte do Fluxo';
      1: rgFaltantes.Caption:='Tipos de Documento de Receb./Desemb. que ainda não fazem parte do Fluxo';
   end;
end;

end.
