unit FPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMPrincipal, Menus, Wwintl, ExtCtrls, Buttons, ComCtrls,
  fTelaAut, uAutorizacao, uSistema, TB97, Db, Wwdatsrc, DBTables, Wwquery,
  wwdblook, StdCtrls, Mask, wwdbedit, DBCtrls, uModulo, TB97Tlwn, TB97Tlbr,
  TB97Ctls, ImgList, CorreioCM, IvDictio, IvAMulti, IvBinDic, IvMulti,
  IvEMulti, fcLabel;

type
  TfrmPrincipal = class(TfrmCMPrincipal)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation
{$R *.DFM}
{$R MensagemRes.Res}

initialization
  ShowMessage( 'Atualize as informações sobre o seu projeto'+#10+#13+
                'Procure a seção INITIALIZATION do frmPrincipal');
   Halt;

   Após ter atualizado as informações abaixo:
   - Retire a linhas abaixo dos comentários
   - Apage as linhas acima, elas nào serão mais necessarias
{
   Sistema.NomeModulo := 'ProjetoCM';    // Nome do Módulo
   Sistema.IdModulo := 23 ;              // IdModulo cadastrado no SAD
   Sistema.Versao := '0.00.00' ;         // Versão sendo compilada
   Sistema.NomeAplicativo := 'Projeto Inicial CM';
}
   Modulo := TModulo.Create  ;

finalization
   Modulo.free;


end.
