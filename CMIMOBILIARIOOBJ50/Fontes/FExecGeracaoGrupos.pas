unit FExecGeracaoGrupos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, ComCtrls, StdCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, ExtCtrls, Mask, Db, DBTables, Wwquery,
  FSairAjudaImob;

type
  TfrmExecGeracaoGrupos = class(TFrmSairAjudaImob)
    btnGera: TBitBtn;
    qryCodigos: TwwQuery;
    qryCodigosIMOCODIGO: TStringField;
    qryCodigosAREA: TFloatField;
    qryCodigosAREA_GERENCIAL: TFloatField;
    Label1: TLabel;
    mskCodigo: TMaskEdit;
    Panel1: TPanel;
    Label13: TLabel;
    Label14: TLabel;
    Label4: TLabel;
    Panel2: TPanel;
    lblContador: TLabel;
    lblProgress: TLabel;
    ProgressBar: TProgressBar;
    ToolbarSep973: TToolbarSep97;

    procedure btnGeraClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private { Private declarations }

    procedure DesabilitaBotoes;
    procedure HabilitaBotoes;
    procedure AtualizaGrupos(sGrupo: string);

  public { Public declarations }

  end;



var
  frmExecGeracaoGrupos: TfrmExecGeracaoGrupos;



implementation
{$R *.DFM}
uses
   uMensErro, uSistema, uFuncoesImob, dImobiliario, FEspera;



procedure TfrmExecGeracaoGrupos.DesabilitaBotoes;
begin
   Screen.Cursor     := crHourGlass;

   btnGera.Enabled   := False;
   bbtnSair.Enabled  := False;
end;



procedure TfrmExecGeracaoGrupos.HabilitaBotoes;
begin
   btnGera.Enabled   := True;
   bbtnSair.Enabled  := True;

   Screen.Cursor     := crDefault;
end;



procedure TfrmExecGeracaoGrupos.AtualizaGrupos(sGrupo: string);
var
   fAtual, fQuant : double;
   sCodigo, sErro : string;
begin
   frmEspera.Config('Aguarde', 'Selecionando Grupos...', False);
   frmEspera.Show;
   Application.ProcessMessages;

   Temporiza(3);

   with qryCodigos do begin
      LimpaParametros(qryCodigos);
      ParamByName('PIDEMPRESAPROP').asInteger := Sistema.idEmpresa;
      ParamByName('PFLGTIPOIMOVEL').asInteger := 1;
      ParamByName('PFLGATIVO').asInteger      := 1;

      // filtra por grupo se este estiver preenchido
      if trim(sGrupo) <> '' then begin
         ParamByName('PIMOCODIGO').asString   := trim(sGrupo);
      end;

      Open;
   end;

   frmEspera.Hide;
   frmEspera.Config('', '', False);

   try

      if qryCodigos.IsEmpty then begin

         MsgDlg('Não há grupos a criar / atualizar.', 'Informação', mtInformation, [mbOk], 0);
         Repaint;

      end else begin

         fQuant := qryCodigos.RecordCount;

         // ProgressBar
         MostraProgresso(ProgressBar, lblProgress, lblContador, fQuant, 'Criando / Atualizando Grupos...');

         qryCodigos.First;
         fAtual := 0;

         while not(qryCodigos.EOF) do begin

            // ProgressBar
            fAtual := fAtual + 1;
            AndaProgresso(ProgressBar, lblProgress, lblContador, fAtual, fQuant);

            sCodigo := FuncoesImob.GeraGrupoRateio(trim(qryCodigosIMOCODIGO.asString), qryCodigosAREA.AsFloat, qryCodigosAREA_GERENCIAL.AsFloat);

            if length(trim(sCodigo)) > 0 then begin
               sErro := 'Houve erro na tentativa gerar / atualizar o Grupo de código ' + sCodigo + #13 +
                        'Deseja continuar com a geração / atualização do restante dos grupos?';

               Screen.Cursor := crDefault;

               if MsgDlg(sErro, 'Erro', mtError, [mbYes, mbNo], 0) = mrNo then begin
                  // se houve erro e não se deseja continuar...
                  Exit;
               end else begin
                  // continua
                  Screen.Cursor := crHourGlass;
               end;
            end;

            qryCodigos.Next;
         end;

      end;

   finally
      EscondeProgresso(ProgressBar, lblProgress, lblContador);
      LimpaParametros(qryCodigos);
   end;
end;



procedure TfrmExecGeracaoGrupos.btnGeraClick(Sender: TObject);
begin
   inherited;

   try
      DesabilitaBotoes;

      AtualizaGrupos(trim(mskCodigo.Text));

   finally
      HabilitaBotoes;
   end;
end;



procedure TfrmExecGeracaoGrupos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   qryCodigos.Close;
   inherited;
end;



end.
