unit FCadTRDxCResponMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, StdCtrls, ExtCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid,
  MontaSelect, Db, DBClient, uCMClientDataSet, CmEventosCadastro, ImgList,
  Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, TB97Ctls, TB97,
  wwdblook, uCtrlListTercFinanc, uCtrlTRDxCRespon, FOkCancelar, Provider,
  DBTables, Wwquery;

type
  TFrmCadTRDxCResponMT = class(TFrmOkCancelar)
    PnlCadastro: TPanel;
    pnlCR: TPanel;
    Label1: TLabel;
    PnlCtrls: TPanel;
    BtnExcluiSelecionado: TSpeedButton;
    BtnExcluiTodosSelecionados: TSpeedButton;
    BtnIncluiDisponivel: TSpeedButton;
    BtnIncluiTodosDisponiveis: TSpeedButton;
    PnlDesemb: TPanel;
    dblcCRespon: TwwDBLookupCombo;
    cdsCentroRespon: TCMClientDataSet;
    cdsTRDDisponiveis: TCMClientDataSet;
    dsTRDDisponiveis: TwwDataSource;
    dbgTRDDisponiveis: TwwDBGrid;
    dbgTRDSelecionados: TwwDBGrid;
    PnlTitDesemb: TPanel;
    PnlTitTipoAgreAssoc: TPanel;
    rdgTiposRD: TRadioGroup;
    pnlTopoSelecionados: TPanel;
    cdsTRDSelecionados: TCMClientDataSet;
    dsTRDSelecionados: TwwDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure BtnExcluiSelecionadoClick(Sender: TObject);
    procedure BtnExcluiTodosSelecionadosClick(Sender: TObject);
    procedure BtnIncluiTodosDisponiveisClick(Sender: TObject);
    procedure BtnIncluiDisponivelClick(Sender: TObject);
    procedure rdgTiposRDClick(Sender: TObject);
    procedure dblcCResponChange(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    CtrlTRDxCRespon : TCtrlTRDxCRespon;
    CtrlListTerceiros : TCtrlListTercFinanc;

  public
    { Public declarations }
  end;

var
  FrmCadTRDxCResponMT: TFrmCadTRDxCResponMT;

implementation

{$R *.DFM}

uses dBaseDados, uSistema, uMensErro;

procedure TFrmCadTRDxCResponMT.FormCreate(Sender: TObject);
begin
   inherited;
   //Inicializa Ctrl de TRDxCR
   CtrlTRDxCRespon:=TCtrlTRDxCRespon.Create;
   CtrlTRDxCRespon.Initialize(dtmBaseDados.dbBaseDados,True);

   CtrlTRDxCRespon.CdsTRDxCRespon:=cdsTRDSelecionados;

   //Inicializa Ctrl de List de Terceiros
   CtrlListTerceiros:=TCtrlListTercFinanc.Create;
   CtrlListTerceiros.Initialize(dtmBaseDados.dbBaseDados,True);

   //Carrega Cds de Centro de Responsabilidade
   cdsCentroRespon.Data:=CtrlListTerceiros.ListCentroRespon(Sistema.IdEmpresa,'A','S','');
end;

procedure TFrmCadTRDxCResponMT.FormDestroy(Sender: TObject);
begin
   CtrlTRDxCRespon.Free;
   CtrlListTerceiros.Free;
   inherited;
end;

procedure TFrmCadTRDxCResponMT.dblcCResponChange(Sender: TObject);
begin
   //Carrega Cds TRD de Selecionados
   cdsTRDSelecionados.Data:=CtrlTRDxCRespon.ListTRDxCRSelec(Sistema.IdEmpresa,
                      cdsCentroRespon.FieldByName('CodCentroRespon').AsString);
   //Carrega Cds TRD de Disponíveis
   cdsTRDDisponiveis.Data:=CtrlTRDxCRespon.ListTRDxCRDispon(Sistema.IdEmpresa,
                      cdsCentroRespon.FieldByName('CodCentroRespon').AsString);

   bbtnCancelar.Enabled:=True;
   rdgTiposRD.ItemIndex:=2;
   rdgTiposRDClick(nil);
end;

procedure TFrmCadTRDxCResponMT.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   cdsTRDSelecionados.Filtered:=False;
   if not(CtrlTRDxCRespon.AplicaAtualTRDxCRespon) then
      MsgDlg(CtrlTRDxCRespon.MessageInfo,'Erro',mtError,[mbOk],0);
   cdsTRDSelecionados.Filtered:=True;
   bbtnCancelarClick(nil);   
end;

procedure TFrmCadTRDxCResponMT.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   dblcCRespon.Enabled:=True;
   dblcCRespon.Clear;
   if cdsTRDDisponiveis.Active  then cdsTRDDisponiveis.Close;
   if cdsTRDSelecionados.Active then cdsTRDSelecionados.Close;
   bbtnConfirmar.Enabled:=False;
   bbtnCancelar.Enabled:=False;
end;

procedure TFrmCadTRDxCResponMT.BtnExcluiSelecionadoClick(Sender: TObject);
begin
   if cdsTRDSelecionados.IsEmpty then Exit;

   dblcCRespon.Enabled:=False;
   bbtnConfirmar.Enabled:=True;

   cdsTRDDisponiveis.Append;
   cdsTRDDisponiveis.FieldByName('CodTipRecDes').AsString:=
                     cdsTRDSelecionados.FieldByName('CodTipRecDes').AsString;
   cdsTRDDisponiveis.FieldByName('RecPag').AsString:=
                     cdsTRDSelecionados.FieldByName('RecPag').AsString;
   cdsTRDDisponiveis.FieldByName('Descricao').AsString:=
                     cdsTRDSelecionados.FieldByName('Descricao').AsString;
   cdsTRDDisponiveis.Post;

   cdsTRDSelecionados.Delete;
end;

procedure TFrmCadTRDxCResponMT.BtnExcluiTodosSelecionadosClick(
  Sender: TObject);
begin
   if cdsTRDSelecionados.IsEmpty then Exit;

   dblcCRespon.Enabled:=False;
   bbtnConfirmar.Enabled:=True;
   
   cdsTRDSelecionados.First;
   while not(cdsTRDSelecionados.Eof) do
   begin
      cdsTRDDisponiveis.Append;
      cdsTRDDisponiveis.FieldByName('CodTipRecDes').AsString:=
                        cdsTRDSelecionados.FieldByName('CodTipRecDes').AsString;
      cdsTRDDisponiveis.FieldByName('RecPag').AsString:=
                        cdsTRDSelecionados.FieldByName('RecPag').AsString;
      cdsTRDDisponiveis.FieldByName('Descricao').AsString:=
                        cdsTRDSelecionados.FieldByName('Descricao').AsString;
      cdsTRDDisponiveis.Post;

      cdsTRDSelecionados.Delete;
   end;
end;

procedure TFrmCadTRDxCResponMT.BtnIncluiTodosDisponiveisClick(
  Sender: TObject);
begin
   if cdsTRDDisponiveis.IsEmpty then Exit;

   dblcCRespon.Enabled:=False;
   bbtnConfirmar.Enabled:=True;
   
   if Trim(dblcCRespon.Text)='' then
    begin
       MsgDlg('Não foi selecionado nenhum Centro de Responsabilidade','Erro',mtError,[mbOk],0);
       dblcCRespon.SetFocus;
    end;

   cdsTRDDisponiveis.First;
   while not(cdsTRDDisponiveis.Eof) do
   begin
      cdsTRDSelecionados.Append;
      cdsTRDSelecionados.FieldByName('CodTipRecDes').AsString:=
                        cdsTRDDisponiveis.FieldByName('CodTipRecDes').AsString;
      cdsTRDSelecionados.FieldByName('RecPag').AsString:=
                        cdsTRDDisponiveis.FieldByName('RecPag').AsString;
      cdsTRDSelecionados.FieldByName('Descricao').AsString:=
                        cdsTRDDisponiveis.FieldByName('Descricao').AsString;
      cdsTRDSelecionados.FieldByName('CodCentroRespon').AsString:=
                        cdsCentroRespon.FieldByName('CodCentroRespon').AsString;
      cdsTRDSelecionados.FieldByName('IDPessoa').AsFloat:=Sistema.IdEmpresa;

      cdsTRDSelecionados.Post;

      cdsTRDDisponiveis.Delete;
   end;
end;

procedure TFrmCadTRDxCResponMT.BtnIncluiDisponivelClick(Sender: TObject);
begin
   if cdsTRDDisponiveis.IsEmpty then Exit;

   dblcCRespon.Enabled:=False;
   bbtnConfirmar.Enabled:=True;
         
   if Trim(dblcCRespon.Text)='' then
    begin
       MsgDlg('Não foi selecionado nenhum Centro de Responsabilidade','Erro',mtError,[mbOk],0);
       dblcCRespon.SetFocus;
    end;

   cdsTRDSelecionados.Append;
   cdsTRDSelecionados.FieldByName('CodTipRecDes').AsString:=
                     cdsTRDDisponiveis.FieldByName('CodTipRecDes').AsString;
   cdsTRDSelecionados.FieldByName('RecPag').AsString:=
                     cdsTRDDisponiveis.FieldByName('RecPag').AsString;
   cdsTRDSelecionados.FieldByName('Descricao').AsString:=
                     cdsTRDDisponiveis.FieldByName('Descricao').AsString;
   cdsTRDSelecionados.FieldByName('CodCentroRespon').AsString:=
                     cdsCentroRespon.FieldByName('CodCentroRespon').AsString;
   cdsTRDSelecionados.FieldByName('IDPessoa').AsFloat:=Sistema.IdEmpresa;

   cdsTRDSelecionados.Post;

   cdsTRDDisponiveis.Delete;
end;

procedure TFrmCadTRDxCResponMT.rdgTiposRDClick(Sender: TObject);
begin
   case rdgTiposRD.ItemIndex of
      0: begin
            cdsTRDDisponiveis.Filtered:=False;
            cdsTRDDisponiveis.Filter:='RECPAG = ''R''';
            cdsTRDDisponiveis.Filtered:=True;
         end;
      1: begin
            cdsTRDDisponiveis.Filtered:=False;
            cdsTRDDisponiveis.Filter:='RECPAG = ''P''';
            cdsTRDDisponiveis.Filtered:=True;
         end;
      2: begin
            cdsTRDDisponiveis.Filtered:=False;
            cdsTRDDisponiveis.Filter:='';
            cdsTRDDisponiveis.Filtered:=True;
         end;
   end;
end;

end.
