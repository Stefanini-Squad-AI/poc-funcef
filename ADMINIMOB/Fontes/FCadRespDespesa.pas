unit FCadRespDespesa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjudaImob, Db, DBTables, Wwquery, Wwdatsrc, fcButton, fcImgBtn,
  fcShapeBtn, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, mContrato;

type
  TfrmCadRespDespesa = class(TfrmSairAjudaImob)
    DBgrdDespLocatario: TwwDBGrid;
    DBgrdDespFundacao: TwwDBGrid;
    dsDespFundacao: TwwDataSource;
    qryDespFundacao: TwwQuery;
    Panel3: TPanel;
    Panel1: TPanel;
    molContrato1: TmolContrato;
    Label2: TLabel;
    edtNFLocatario: TEdit;
    edtRSLocatario: TEdit;
    Bevel1: TBevel;
    Label1: TLabel;
    btnFLUm: TfcShapeBtn;
    btnFLTodos: TfcShapeBtn;
    btnLFUm: TfcShapeBtn;
    btnLFTodos: TfcShapeBtn;
    qryInsertRespFundacao: TwwQuery;
    qryDespFundacaoIDCONTRATOIMOVEL: TFloatField;
    qryDespFundacaoIDTIPOCUSTORECIMO: TFloatField;
    qryDespFundacaoDESCCUSTORECIMO: TStringField;
    qryDespLocatario: TwwQuery;
    qryDeleteRespFundacao: TwwQuery;
    dsDespLocatario: TwwDataSource;
    qryDespLocatarioDESCCUSTORECIMO: TStringField;
    qryDespLocatarioIDTIPOCUSTORECIMO: TFloatField;
    qryDespFundacaoFLGRESPONSAVEL: TFloatField;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBgrdDespLocatarioCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure DBgrdDespFundacaoCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure DBgrdDespLocatarioTopRowChanged(Sender: TObject);
    procedure DBgrdDespFundacaoTopRowChanged(Sender: TObject);
    procedure molContrato1btnBuscaContratoClick(Sender: TObject);
    procedure btnLFUmClick(Sender: TObject);
    procedure btnLFTodosClick(Sender: TObject);
    procedure btnFLUmClick(Sender: TObject);
    procedure btnFLTodosClick(Sender: TObject);


  private { Private declarations }

    procedure AbrirTabelas;

  public { Public declarations }

  end;


var
  frmCadRespDespesa: TfrmCadRespDespesa;


implementation
{$R *.DFM}
uses
   dMS, uFuncoesImob, uSistema, uDataBase;


procedure TfrmCadRespDespesa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;

   qryDespFundacao.Close;
   qryDespLocatario.Close;
end;


procedure TfrmCadRespDespesa.DBgrdDespLocatarioCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;
   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end else begin
            ABrush.Color := clWhite;
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmCadRespDespesa.DBgrdDespFundacaoCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;
   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end else begin
            ABrush.Color := clWhite;
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmCadRespDespesa.DBgrdDespLocatarioTopRowChanged(Sender: TObject);
begin
   inherited;
   // acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmCadRespDespesa.DBgrdDespFundacaoTopRowChanged(Sender: TObject);
begin
   inherited;
   // acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmCadRespDespesa.molContrato1btnBuscaContratoClick(Sender: TObject);
begin
   inherited;
   molContrato1.btnBuscaContratoClick(Sender);

   if dtmMS.MS_Contrato.RetornouValor then begin

      Screen.Cursor := crHourGlass;

      edtNFLocatario.Text  := dtmMS.MS_Contrato.ValoresChave[4];
      edtRSLocatario.Text  := dtmMS.MS_Contrato.ValoresChave[5];

      AbrirTabelas;

      Screen.Cursor := crDefault;
   end;
end;



procedure TfrmCadRespDespesa.AbrirTabelas;
begin
   with qryDespFundacao do begin
      LimpaParametros(qryDespFundacao);
      ParamByName('PIDCONTRATOIMOVEL').AsInteger := molContrato1.iContrato;
      ParamByName('PIDMODULO').AsInteger := Sistema.IdModulo;
      Open;
   end;

   with qryDespLocatario do begin
      LimpaParametros(qryDespLocatario);
      ParamByName('PIDCONTRATOIMOVEL').AsInteger := molContrato1.iContrato;
      ParamByName('PIDMODULO').AsInteger := Sistema.IdModulo;
      Open;
   end;
end;


procedure TfrmCadRespDespesa.btnLFUmClick(Sender: TObject);
begin
   inherited;
   qryDespFundacao.DisableControls;
   qryDespLocatario.DisableControls;

   StartTransacao;
   try
      qryInsertRespFundacao.ParamByName('PIDCONTRATOIMOVEL').AsInteger  := molContrato1.iContrato;
      qryInsertRespFundacao.ParamByName('PIDTIPOCUSTORECIMO').AsInteger := qryDespLocatarioIDTIPOCUSTORECIMO.AsInteger;
      qryInsertRespFundacao.ExecSQL;
      CommitTransacao;
   except
      RollBackTransacao;
   end;

   AbrirTabelas;
   qryDespFundacao.EnableControls;
   qryDespLocatario.EnableControls;
end;

procedure TfrmCadRespDespesa.btnLFTodosClick(Sender: TObject);
begin
  inherited;
   qryDespFundacao.DisableControls;
   qryDespLocatario.DisableControls;

   StartTransacao;
   qryDespLocatario.First;
   try
      while not qryDespLocatario.Eof do begin
         qryInsertRespFundacao.ParamByName('PIDCONTRATOIMOVEL').AsInteger  := molContrato1.iContrato;
         qryInsertRespFundacao.ParamByName('PIDTIPOCUSTORECIMO').AsInteger := qryDespLocatarioIDTIPOCUSTORECIMO.AsInteger;
         qryInsertRespFundacao.ExecSQL;
         qryDespLocatario.Next;
      end;
      CommitTransacao;
   except
      RollBackTransacao;
   end;

   AbrirTabelas;
   qryDespFundacao.EnableControls;
   qryDespLocatario.EnableControls;

end;

procedure TfrmCadRespDespesa.btnFLUmClick(Sender: TObject);
begin
   inherited;
   qryDespFundacao.DisableControls;
   qryDespLocatario.DisableControls;

   StartTransacao;
   try
      qryDeleteRespFundacao.ParamByName('PIDCONTRATOIMOVEL').AsInteger  := molContrato1.iContrato;
      qryDeleteRespFundacao.ParamByName('PIDTIPOCUSTORECIMO').AsInteger := qryDespFundacaoIDTIPOCUSTORECIMO.AsInteger;
      qryDeleteRespFundacao.ExecSQL;
      CommitTransacao;
   except
      RollBackTransacao;
   end;

   AbrirTabelas;
   qryDespFundacao.EnableControls;
   qryDespLocatario.EnableControls;

end;

procedure TfrmCadRespDespesa.btnFLTodosClick(Sender: TObject);
begin
   inherited;
   qryDespFundacao.DisableControls;
   qryDespLocatario.DisableControls;

   qryDespFundacao.First;
   StartTransacao;
   try
      while not qryDespFundacao.Eof do begin
         qryDeleteRespFundacao.ParamByName('PIDCONTRATOIMOVEL').AsInteger  := molContrato1.iContrato;
         qryDeleteRespFundacao.ParamByName('PIDTIPOCUSTORECIMO').AsInteger := qryDespFundacaoIDTIPOCUSTORECIMO.AsInteger;
         qryDeleteRespFundacao.ExecSQL;

         qryDespFundacao.Next;
      end;
      CommitTransacao;
   except
      RollBackTransacao;
   end;

   AbrirTabelas;
   qryDespFundacao.EnableControls;
   qryDespLocatario.EnableControls;

end;

end.
