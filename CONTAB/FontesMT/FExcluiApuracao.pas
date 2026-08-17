unit FExcluiApuracao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, wwdblook, Db,
  DBClient, uCMClientDataSet, uCtrlProcessaContab, uCtrlPadroes,
  uCtrlPeriodo, uSistema;

type
  TFrmExcluiApuracao = class(TfrmOkCancelar)
    Panel1: TPanel;
    Panel2: TPanel;
    Label3: TLabel;
    dblkExerc: TwwDBLookupCombo;
    Label4: TLabel;
    dblkPeriodo: TwwDBLookupCombo;
    btSeleciona: TBitBtn;
    Grid: TwwDBGrid;
    Cds: TCMClientDataSet;
    ds: TDataSource;
    cdsExercicio: TCMClientDataSet;
    cdsPeriodo: TCMClientDataSet;
    procedure GridCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure GridTopRowChanged(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btSelecionaClick(Sender: TObject);
    procedure CdsAfterOpen(DataSet: TDataSet);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    CtrlProcessaContab : TCtrlProcessaContab;
    CtrlPeriodo        : TCtrlPeriodo;
  public
    { Public declarations }
  end;




var
  FrmExcluiApuracao: TFrmExcluiApuracao;

implementation


uses UMensErro, uDatabase, DBaseDados,  uData;

{$R *.DFM}

procedure TFrmExcluiApuracao.GridCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
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




procedure TFrmExcluiApuracao.GridTopRowChanged(Sender: TObject);
begin
  inherited;
  Grid.Invalidate;
end;




procedure TFrmExcluiApuracao.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlProcessaContab := TCtrlProcessaContab.Create;
  CtrlProcessaContab.InitializeAs(Padroes);

  CtrlPeriodo := TCtrlPeriodo.Create;
  CtrlPeriodo.InitializeAs(Padroes);


  CtrlPeriodo        := TCtrlPeriodo.Create;
  CtrlPeriodo.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  CdsExercicio.Data := CtrlPeriodo.ListExercicios(Sistema.idEmpresa,False);
  CdsPeriodo.Data   := CtrlPeriodo.ListPeriodo(Sistema.idEmpresa,tbpTodos,0,0);
end;




procedure TFrmExcluiApuracao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(CtrlPeriodo);
  FreeAndNil(CtrlProcessaContab);
  inherited;
end;




procedure TFrmExcluiApuracao.btSelecionaClick(Sender: TObject);
begin
  inherited;

  Cds.Data := CtrlProcessaContab.ListaApurResultado(StrToInt(dblkPeriodo.LookupValue),
                                                    StrToInt(dblkExerc.LookupValue));
end;




procedure TFrmExcluiApuracao.CdsAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TStringField(Cds.FieldByName('PLANO')).ReadOnly     := True;
  TStringField(Cds.FieldByName('PATRO')).ReadOnly     := True;
  TStringField(Cds.FieldByName('PLNPLANIL')).ReadOnly := True;
  TStringField(Cds.FieldByName('PLNDATDIA')).ReadOnly := True;
end;




procedure TFrmExcluiApuracao.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if not CtrlProcessaContab.ExcluiApurResultado(Cds.Data,
                                                Sistema.IdUsuario,
                                                Sistema.IdModulo,
                                                Sistema.UsaPlanoPatro) then
     MsgDlg('Não foi possível excluir a apuração de resultado.' + #13 +
            'Motivo: ' + CtrlProcessaContab.MessageInfo,'Erro',mtError,[mbOk],0)
  else
  begin
     MsgDlg('Processo concluído com sucesso!','Informação',mtInformation,[mbOk],0);
     bbtnConfirmar.Enabled := False;
  end;
end;

end.
