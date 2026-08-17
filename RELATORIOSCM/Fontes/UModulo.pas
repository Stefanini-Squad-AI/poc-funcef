(*******************************************************************************
 Histórico

 04/12/98
 Implementacao da procedure TiraIcone
*******************************************************************************)

unit UModulo;

interface

Uses WwQuery, Forms, SysUtils, uMensErro, Dialogs;

type
  TTipoRelatorio = (trRelatorio, trGrafico);

  TModulo = Class
   private
     FExemplo, FRelatorioManual, FConsultaManual: string;
     FNovoDv, FNovoRpt, FAlteraRelat, FAlteraDv, FbConsultaManual: Boolean;
     FIdConsultaManual: Integer;
   public
     property Exemplo: string read FExemplo write FExemplo;
     property bNovoDv: Boolean read FNovoDv write FNovoDv;
     property bNovoRpt: Boolean read FNovoRpt write FNovoRpt;
     property bAlteraDv: Boolean read FAlteraDv write FAlteraDv;
     property bConsultaManual: Boolean read FbConsultaManual write FbConsultaManual;
     property bAlteraRelat: Boolean read FAlteraRelat write FAlteraRelat;
     property RelatorioManual: string read FRelatorioManual write FRelatorioManual;
     property ConsultaManual: string read FConsultaManual write FConsultaManual;
     property IdConsultaManual: Integer read FIdConsultaManual write FIdConsultaManual;
     procedure VerificaParametros(Qry: TwwQuery);
     procedure ApagaArquivo(sArquivo: String);
     procedure BuscaParam(iEmpresa: Integer);
     procedure CadastraReports(Tipo: TTipoRelatorio);
   end;

var Modulo: TModulo;

implementation

Uses uSistema, dBaseDados, uDataBase, FCadRelatorioMT;

procedure TModulo.VerificaParametros(Qry: TwwQuery);
Var
  iNumprams, X: Integer;
begin
  inherited;

  With Qry Do Begin
       iNumprams := Params.count;

       If iNumprams <> 0 Then Begin
          Prepare;

          For x := 0 To iNumprams - 1 Do Begin
              If Params.Items[x].Name = 'PEMPRESAPROP' Then
                 Params[x].ASString := Sistema.NomeEmpresa
              Else
                 If Params.Items[x].Name = 'PSISTEMA' Then
                    Params[x].ASString := Sistema.NomeModulo + ' - ' + Sistema.Versao
                 Else
                    If Params.Items[x].Name = 'PIDPESSOA' Then
                       Params[x].AsInteger := Sistema.IdEmpresa;
          End;
       End;
  End;
End;

procedure TModulo.ApagaArquivo(sArquivo:String);
Begin
  If FileExists( sArquivo ) Then
     DeleteFile( sArquivo );
End;

procedure TModulo.BuscaParam(iEmpresa: Integer);
Begin

End;

procedure Tmodulo.CadastraReports( Tipo: TTipoRelatorio );
Begin
  Try
     Application.CreateForm( TFrmCadRelatorio, FrmCadRelatorio );
     FrmCadRelatorio.SetTipoRelatorio( Tipo );
     FrmCadRelatorio.ShowModal;
  Finally
     FrmCadRelatorio.Free;
  end;
End;

end.
