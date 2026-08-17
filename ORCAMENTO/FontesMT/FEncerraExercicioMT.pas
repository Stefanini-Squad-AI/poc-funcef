// data : 27/10/2003 - André Tavares - pendência 14009
unit FEncerraExercicioMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, StdCtrls, ComCtrls, wwdblook, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, Wwqbe, DBTables, Wwquery,
  DBClient, uCMClientDataSet,uCtrlPeriodoOrcamen, uCtrlContaOrcamentaria, uCMTypes;
  

type
  TfrmEncerraExercicioMT = class(TfrmSairAjuda)
    dblkExercicio: TwwDBLookupCombo;
    Label1: TLabel;
    pgrStatus: TProgressBar;
    edtStatus: TEdit;
    Label2: TLabel;
    bbtnEncerra: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    cdsExercicio: TCMClientDataSet;
    cdsContas: TCMClientDataSet;
    procedure FormShow(Sender: TObject);
    procedure bbtnEncerraClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dblkExercicioChange(Sender: TObject);
  private
    { Private declarations }
    CtrlPeriodoOrcamen: TCtrlPeriodoOrcamen;
    CtrlContaOrcamentaria: TCtrlContaOrcamentaria;
  public
    { Public declarations }
  end;

var
  frmEncerraExercicioMT: TfrmEncerraExercicioMT;

implementation

uses UMensErro, uDatabase, DBaseDados, uAutorizacao, uSistema, uModulo,
  uCtrlOrcamento, ppTypes;
 


{$R *.DFM}

procedure TfrmEncerraExercicioMT.FormShow(Sender: TObject);
begin
  inherited;
  with cdsExercicio do begin
    Data := CtrlPeriodoOrcamen.Exercicios(sistema.idEmpresa);
  end;
end;



procedure TfrmEncerraExercicioMT.bbtnEncerraClick(Sender: TObject);
var sMsg : string;
begin
  inherited;
  sMsg := 'Deseja REALMENTE encerrar o Exercício? ' + CHR(13);
  sMsg := sMsg + 'Se prosseguir, TODOS os Períodos serão bloqueados!' + CHR(13);
  if MsgDlg(sMsg, 'Aviso', mtConfirmation, [mbYes, mbNo], 0) = mrNo then begin
    Exit;
  end;
  if dblkExercicio.text = '' then begin
    MsgDlg('O exercício deve ser preenchido.', 'Aviso', mtWarning, [mbOk], 0);
    dblkExercicio.SetFocus;
    Exit;
  end;
  screen.cursor := crHourglass;
  CtrlContaOrcamentaria.StartTransactionOrc;
  try
    pgrStatus.position := 0;
    CtrlPeriodoOrcamen.EncerraExercicio(sistema.idEmpresa,
                       StrToInt(dblkExercicio.text));
    with cdsContas do begin
      Data := CtrlContaOrcamentaria.Contas(modulo.iPlanoOrc);
      pgrStatus.position := RecordCount;
      First;
      while not eof do begin
       (* edtStatus.text := 'Processando Conta: ' +
                          IntToStr(FieldByName('IDCONTAORCAMEN').asInteger);
        pgrStatus.position := pgrStatus.position + 1;    *)

                (*Pendência 27760 Cadu 27760*)
        edtStatus.text := 'Processando Conta: ' +
                          (FieldByName('IDCONTAORCAMEN').AsString);
        pgrStatus.position := pgrStatus.position + 1;
        Next;
      end;
    end;
    CtrlContaOrcamentaria.CommitOrc;
    MsgDlg('Exercício encerrado com sucesso.','Aviso',mtInformation,[mbOk],0);
  except
    CtrlContaOrcamentaria.RollBackOrc;
    MsgDlg('Encerramento do exercício com problemas. O estado anterior do ' +
           'Banco de Dados será retornado.','Erro',mtError,[mbOk],0);
  end;
  screen.cursor := crDefault;

  try
    Sistema.GravaLogOperacoes('Encerramento de Exercício');
  except
    Raise Exception.Create('Não foi possível Gravar o Log');
  end;

end;



procedure TfrmEncerraExercicioMT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlPeriodoOrcamen    := TCtrlPeriodoOrcamen.Create;
  CtrlContaOrcamentaria := TCtrlContaOrcamentaria.Create;

  CtrlPeriodoOrcamen.Initialize( DtmBaseDados.dbBaseDados, True,
                                 Sistema.ConnectionType,   Sistema.ConnectionSide,
                                 Sistema.AppRemoteServer,  True, nil, nil, False );

  CtrlContaOrcamentaria.Initialize( DtmBaseDados.dbBaseDados, True,
                                    Sistema.ConnectionType,   Sistema.ConnectionSide,
                                    Sistema.AppRemoteServer,  True, nil, nil, False );
end;

procedure TfrmEncerraExercicioMT.dblkExercicioChange(Sender: TObject);
begin
  inherited;
  if Trim(dblkExercicio.Text) <> '' then begin
    bbtnEncerra.Enabled := true;
  end else begin
    bbtnEncerra.Enabled := false;
  end;
end;

end.
