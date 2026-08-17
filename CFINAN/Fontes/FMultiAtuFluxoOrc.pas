unit FMultiAtuFluxoOrc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ComCtrls, Db, DBTables, Wwquery, wwdbdatetimepicker,
  CMDateTimePicker, ExtCtrls, Wwqbe;

type
  TfrmMultiAtuFluxoOrc = class(TfrmSairAjuda)
    gpbPeriodo: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    DtInicial: TCMDateTimePicker;
    DtFinal: TCMDateTimePicker;
    AnimateAtualizacao: TAnimate;
    qryCriaFluxo: TwwQuery;
    qryExcluiLancamentos: TwwQuery;
    bbtnAtualizaFluxo: TBitBtn;
    qryMinMax: TwwQuery;
    qryMinMaxDTMENOR: TDateTimeField;
    qryMinMaxDTMAIOR: TDateTimeField;
    procedure FormCreate(Sender: TObject);
    procedure bbtnAtualizaFluxoClick(Sender: TObject);
    procedure DtInicialChange(Sender: TObject);
    procedure DtFinalChange(Sender: TObject);
  private
    { Private declarations }
    sTipoAtualizacao: String;
  public
    { Public declarations }
    sTodoFluxo      : String;
    procedure MudaTitulo(TipoAtualizacao: String);
  end;

var
  frmMultiAtuFluxoOrc: TfrmMultiAtuFluxoOrc;

implementation

{$R *.DFM}

Uses uMensErro, uSistema, uDataBase;

procedure TfrmMultiAtuFluxoOrc.FormCreate(Sender: TObject);
begin
   inherited;
   sTipoAtualizacao:='';
end;

procedure TfrmMultiAtuFluxoOrc.MudaTitulo(TipoAtualizacao: String);
begin
   inherited;
   sTipoAtualizacao:=TipoAtualizacao;
   if sTipoAtualizacao='LM' then
      Caption:='Atualização de Fluxo Orçado de Médio Prazo a partir do Orçado de Longo Prazo';
   if (sTipoAtualizacao='MC') or (sTipoAtualizacao='MCTOT') then
      Caption:='Atualização de Fluxo Orçado de Curto Prazo a partir do Orçado de Médio Prazo';
   if (sTipoAtualizacao='MCTOT') then
    begin
       gpbPeriodo.Enabled:=False;

       qryMinMax.Close;
       qryMinMax.ParamByName('IDPESSOA').AsFloat     :=Sistema.IdEmpresa;
       qryMinMax.ParamByName('FluxoOrigem').AsString :=Copy(sTipoAtualizacao,1,1);
       qryMinMax.Open;

       DtInicial.Date:=qryMinMaxDTMENOR.AsDateTime;
       DtFinal.Date:=qryMinMaxDTMAIOR.AsDateTime;
       qryMinMax.Close;
    end;
end;

procedure TfrmMultiAtuFluxoOrc.DtInicialChange(Sender: TObject);
begin
   if ((Trim(DtFinal.Text)='') or (DtFinal.Date<DtInicial.Date)) and (Trim(DtInicial.Text)<>'') then
      DtFinal.Text:=DtInicial.Text;
end;

procedure TfrmMultiAtuFluxoOrc.DtFinalChange(Sender: TObject);
begin
   if (DtFinal.Date<DtInicial.Date) and (Trim(DtFinal.Text)<>'')then DtFinal.Text:=DtInicial.Text;
end;

procedure TfrmMultiAtuFluxoOrc.bbtnAtualizaFluxoClick(Sender: TObject);
begin
   if (Trim(DtInicial.Text)='') and (gpbPeriodo.Enabled) then
    begin
       MsgDlg('Data Inicial Inválida !','Erro',mtError,[mbOk],0);
       DtInicial.SetFocus;
       Exit;
    end;

   if (Trim(DtFinal.Text)='') and (gpbPeriodo.Enabled) then
    begin
       MsgDlg('Data Final Inválida !','Erro',mtError,[mbOk],0);
       DtFinal.SetFocus;
       Exit;
    end;

   if (Trim(DtInicial.Text)='') or (Trim(DtFinal.Text)='') then
      MsgDlg('Não Existem dados a serem Atualizados ! ','Aviso',mtWarning,[mbOk],0)
   else
    begin
       AnimateAtualizacao.Active:=True;
       try
          StartTransacao;
              //
             // Exclui Lancamentos do Fluxo de Destino para o período solicitado
             //
             qryExcluiLancamentos.ParamByName('IDPESSOA').AsFloat     :=Sistema.IdEmpresa;
             qryExcluiLancamentos.ParamByName('FluxoDestino').AsString:=Copy(sTipoAtualizacao,2,1);
             qryExcluiLancamentos.ParamByName('DataInicial').AsString :=DtInicial.Text;
             qryExcluiLancamentos.ParamByName('DataFinal').AsString   :=DtFinal.Text;
             qryExcluiLancamentos.ExecSQL;

             //
             // Cria novos Lancamentos no Fluxo de Destino para o período solicitado
             //
             qryCriaFluxo.ParamByName('IDPESSOA').AsFloat     :=Sistema.IdEmpresa;
             qryCriaFluxo.ParamByName('FluxoOrigem').AsString :=Copy(sTipoAtualizacao,1,1);
             qryCriaFluxo.ParamByName('FluxoDestino').AsString:=Copy(sTipoAtualizacao,2,1);
             qryCriaFluxo.ParamByName('DataInicial').AsString :=DtInicial.Text;
             qryCriaFluxo.ParamByName('DataFinal').AsString   :=DtFinal.Text;
             qryCriaFluxo.ExecSQL;
          CommitTransacao;

          MsgDlg('Atualização completada com Sucesso !','Aviso',mtWarning,[mbOk],0);
       finally
          AnimateAtualizacao.Active:=False;
       end;
    end;
end;

end.
