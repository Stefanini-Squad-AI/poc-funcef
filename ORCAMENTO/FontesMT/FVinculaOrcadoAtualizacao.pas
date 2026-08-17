{--------------------------------------------------------------------------------------------------
Rotina......: ListarContabPlano, ListarContabPatro
Nº SOL......: 244908
Nº PPM .....: 608397
Data........: 12/12/2013
Responsável.: Fernando Xavier
Descrição...: Ao tentar realizar a atualização de todos os grupos, de acordo com a faixa de grupos
              definido, ocorre um erro ao dar ok.
---------------------------------------------------------------------------------------------------
Rotina......: ListarGruposOrcamen
Nº SOL......: 192391
Nº KINTANA..: 1833220
Data........: 29/10/2012
Responsável.: Edilaine Ferraresi
Descrição...: incluir condição plano orçamentário
{ --------------------------------------------------------------------------------------------------
// Rotina........: Processar
// Autor.........: Edilaine Ferraresi
// Data..........: 23/03/2012
// Nº SOL........: 172383-7764
// Nº KINTANA....: 1556975
// Descrição.....: Adicionado parâmetro de Plano orçamentario selecionado em VinculaOrcadoContabil
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: Todo o Formulário
Nº SOL......: 159242/6041
Nº KINTANA..: 1385831
Data........: 31/06/2011
Responsável.: Ricardo de Freitas Araújo
Descrição...: TELA DE VINCULAÇÃO DE CONTAS CONTÁBEIS COM TODOS OS GRUPOS
----------------------------------------------------------------------------------------------------}

unit FVinculaOrcadoAtualizacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Gauges, Buttons, DBTables, Wwquery, uCMClientDataSet,
  Db, DBClient, USistema,DBaseDados,uCtrlCadContasContabPorGrupo;

type
  TFrmVinculaOrcadoAtualizacao = class(TForm)
    GaProgresso: TGauge;
    lblStatus: TLabel;
    btnFechar: TBitBtn;
    btnIniciar: TBitBtn;
    lbl1: TLabel;
    edtGrupoInicial: TEdit;
    edtGrupoFinal: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure btnFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnIniciarClick(Sender: TObject);
  private
    { Private declarations }
    lstContas:TStringList;
    idPlanoContas:string;
    idPlanoContasDescr:string;
    function  Processar:Boolean;
  public
    { Public declarations }
    function InicializarAtualizacao():boolean;
  end;

var
  FrmVinculaOrcadoAtualizacao: TFrmVinculaOrcadoAtualizacao;
implementation

uses FVinculaOrcadoContabil, FVinculaOrcadoContabilDetalhe,
  uCtrlVinculaOrcadoContabil, FProgresso;

{$R *.DFM}

{ TFrmVinculaOrcadoAtualizacao }

function TFrmVinculaOrcadoAtualizacao.InicializarAtualizacao: boolean;
begin
     TRY
         result := False;

         with frmVinculaOrcadoContabil Do
         begin

              cdsGrupoOrcamen.First;

              GaProgresso.Progress := 0;
              GaProgresso.MinValue := 0;
              GaProgresso.MaxValue := cdsGrupoOrcamen.RecordCount;

              while not cdsGrupoOrcamen.eof Do
              begin
                   lblStatus.Caption := 'Atualizando grupo: ' + cdsGrupoOrcamen.fieldbyname('CODGRUPOORC').Asstring + ' - ' +
                                        cdsGrupoOrcamen.fieldbyname('NOMEGRUPOORCAMEN').Asstring + '...';
                   //Processa
                   Processar();

                   //Próximo
                   cdsGrupoOrcamen.Next;
                   GaProgresso.Progress := GaProgresso.Progress + 1;
                   Application.ProcessMessages;
              end;
         end;

         result := true;

     FINALLY
         btnFechar.Enabled := True;
         Application.ProcessMessages;
     end;
end;

function TFrmVinculaOrcadoAtualizacao.Processar: Boolean;
begin

     Result := false;

     with FrmVinculaOrcadoDetalhe Do
     begin
          IdGrupoOrcamen    := frmVinculaOrcadoContabil.cdsGrupoorcamen.fieldbyname('IDGRUPOORCAMEN').AsInteger;
          CodGrupoOrcamen   := frmVinculaOrcadoContabil.cdsGrupoorcamen.fieldbyname('CODGRUPOORC').AsString;
          DescrGrupoOrcamen := frmVinculaOrcadoContabil.cdsGrupoorcamen.fieldbyname('NOMEGRUPOORCAMEN').AsString;
          //idPlanoOrcamen  := frmVinculaOrcadoContabil.cdsGrupoorcamen.fieldbyname('IDPLANOORCAMEN').AsInteger;  // Edilaine - SOL 172383-7764 / KTN 1556975
          idPlanoOrcamen    := StrToInt( frmVinculaOrcadoContabil.cboPlanoOrc.LookUpValue );                      // Edilaine - SOL 172383-7764 / KTN 1556975
          DescrPlanoOrcamen := frmVinculaOrcadoContabil.cdsGrupoorcamen.fieldbyname('NOMEPLANOORC').AsString;
          iAnoPlanoOrcamen  := frmVinculaOrcadoContabil.cdsGrupoorcamen.fieldbyname('ANO').AsInteger;

          chkVisualizaParametros.Checked := false;
          chkAnaliseContaOrcamen.Checked := false;

          Inicializa();
          bPerguntarVisualiazarLog      := false;
          bExibirProgressoCOntasOrcamen := false;

          VincularContaContabGrupo();
     end;

     //Tudo OK
     Result := true;
end;

procedure TFrmVinculaOrcadoAtualizacao.btnFecharClick(Sender: TObject);
begin
          Close;
end;

procedure TFrmVinculaOrcadoAtualizacao.FormCreate(Sender: TObject);
begin
     //Cria instância do Formulário de Vinculação Detalhe
     FrmVinculaOrcadoDetalhe := TFrmVinculaOrcadoDetalhe.Create(Application);
end;

procedure TFrmVinculaOrcadoAtualizacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     //Destrói instância do Formulário de Vinculação Detalhe
     FreeAndNil(FrmVinculaOrcadoDetalhe);

     FreeAndNil(lstContas);
end;

procedure TFrmVinculaOrcadoAtualizacao.btnIniciarClick(Sender: TObject);
begin
     TRY

        Screen.Cursor := crHourGlass;
        btnIniciar.Enabled := false;
        btnFechar.Enabled := false;

        //Filtra CLlient Dataset
        if (edtGrupoInicial.Text <> '') and (edtGrupoFinal.Text <> '') then
        begin
          frmVinculaOrcadoContabil.cdsGrupoorcamen.EmptyDataSet;
          // Edilaine - SOL 192391 / KTN 1833220
          frmVinculaOrcadoContabil.cdsGrupoOrcamen.Data := CtrlVinculaOrcadoContabil.ListarGruposOrcamen(trim(edtGrupoInicial.Text),
                                                                                                         trim(edtGrupoFinal.Text),
                                                                                                         StrToInt( frmVinculaOrcadoContabil.cboPlanoOrc.LookUpValue ) );
          // Edilaine - SOL 192391 / KTN 1833220 - fim

        end;

        InicializarAtualizacao();
     FINALLY
       Screen.Cursor := crDefault;
     end;
end;

end.
